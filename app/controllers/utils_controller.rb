class UtilsController < ApplicationController
  require 'date'

    #contruct search parameters into an sql query string

    def construct_like_search_query(query)
        query_params = []
        for k,v in query do
          query_params.push("#{k} like '#{v}%' and")
        end
        return query_params.to_s[1..-7].gsub(',', '').gsub('"', '')
    end
end
