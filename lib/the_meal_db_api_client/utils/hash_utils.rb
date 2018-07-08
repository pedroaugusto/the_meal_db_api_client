module TheMealDbApiClient::Utils
  class HashUtils
    def self.filled?(hash, key)
      hash.has_key?(key) && hash[key] && hash[key] != ""
    end
  end
end