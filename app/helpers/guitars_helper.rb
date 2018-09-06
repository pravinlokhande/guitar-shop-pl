module GuitarsHelper
  def get_suggestions(query_text)
    results = { q: query_text, success: true, c: 0, r: [] }
    begin
      source = %w[brand model description price]
      query = {
			    "multi_match": {
			      "query": query_text.downcase,
			      "fields": source
			    }
			  }
      search_response = Guitar.__elasticsearch__.client.search(index: Guitar.index_name, body: {
                                                                     query: query,
                                                                     _source: source,
                                                                     size: 20
                                                                   })
      suggestions = search_response["hits"]
      result_count = suggestions["hits"].length
      results[:c] = result_count
      suggestions["hits"].each do |suggestion|
        result = suggestion["_source"]
        result["id"] = suggestion["_id"]
        results[:r] << OpenStruct.new(result.as_json) unless result.empty?
      end
    rescue StandardError => e
      logger.error("Exception in search: #{e} while searching for #{query}: #{e.message}")
      logger.error("Stack trace: #{e.backtrace.map { |l| "  #{l}\n" }.join}")
      logger.error get_error_message(e)
      return { q: query_text, success: false, error: e.message }
    end
    results
  end
end
