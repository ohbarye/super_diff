module SuperDiff
  module Operations
    def self.const_missing(missing_const_name)
      if Core.const_defined?(missing_const_name)
        warn <<~EOT
          WARNING: SuperDiff::Operations::#{missing_const_name} is deprecated and will be removed in the next major release.
          Please use SuperDiff::Core::#{missing_const_name} instead.
          #{caller_locations.join("\n")}
        EOT
        Core.const_get(missing_const_name)
      else
        super
      end
    end
  end
end
