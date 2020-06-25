module Google

  class NewSearch

    def initialize(query)
      @query = populate_query

      byebug

    end

    def populate_query(query)
      query_has_spaces = query.match(/\s/) ? true : false
      if query_has_spaces
        return query.gsub ' ', '%20'
      else
        return query
      end
    end

    def get

    end


  end

end
