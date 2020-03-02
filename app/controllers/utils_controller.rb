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

    def send_email
    end

    def get_condition(sql_query)
      condition = 'AND'
      if !sql_query.include? 'WHERE'
          condition = 'WHERE'
      end
      return condition
    end

    def construct_date_query(sql_query, table, params=nil)
      if params[:to] && params[:from]
          from_date = params[:from]
          to_date = params[:to]
          condition = get_condition(sql_query)
          sql_query = sql_query + " #{condition} date(#{table}.created_at) BETWEEN '#{from_date}' and '#{to_date}'"
      elsif params[:from]
          from_date = params[:from]
          condition = get_condition(sql_query)
          sql_query = sql_query + " #{condition} date(#{table}.created_at) = '#{from_date}'"
      end 
      return sql_query
    end    
end
