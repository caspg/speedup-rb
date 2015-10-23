require 'sequel'
require 'lotus/model/coercer'
require 'sequel/extensions/pg_json'

class PGJSON < Lotus::Model::Coercer
  def self.dump(value)
    ::Sequel.pg_json(value)
  end

  def self.load(value)
    return if value.nil?
    return ::Kernel.Hash(value) if value.class.to_s.include?('JSONHash')
    ::Kernel.Array(value) if value.class.to_s.include?('JSONArray')
  end
end
