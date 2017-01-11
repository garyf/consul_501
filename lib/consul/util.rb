module Consul
  module Util
    extend self

    def scope_selects_all_records?(scope)
      scope = scope.all
      scope_sql = scope.to_sql
      quoted_table_name = Regexp.quote(scope.connection.quote_table_name(scope.table_name))
      all_sql_pattern = /\ASELECT (#{quoted_table_name}\.)?\* FROM #{quoted_table_name}\z/
      scope_sql.squish =~ all_sql_pattern
    end

    def scope?(value)
      value.respond_to?(:all)
    end

    def collection?(value)
      value.is_a?(Array) || value.is_a?(Set)
    end

    def adjective_and_argument(*args)
      if args.size > 1
        adjective = args[0]
        record = args[1]
      else
        adjective = nil
        record = args[0]
      end
      [adjective, record]
    end
  end
end
