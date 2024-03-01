module SuperDiff
  module Differs
    def self.const_missing(missing_const_name)
      if missing_const_name == :Base
        warn <<~EOT
          WARNING: SuperDiff::Differs::#{missing_const_name} is deprecated and will be removed in the next major release.
          Please use SuperDiff::Core::AbstractDiffer instead.
          #{caller_locations.join("\n")}
        EOT
        Core::AbstractDiffer
      elsif Basic::Differs.const_defined?(missing_const_name)
        warn <<~EOT
          WARNING: SuperDiff::Differs::#{missing_const_name} is deprecated and will be removed in the next major release.
          Please use SuperDiff::Basic::Differs::#{missing_const_name} instead.
          #{caller_locations.join("\n")}
        EOT
        Basic::Differs.const_get(missing_const_name)
      else
        super
      end
    end
  end
end
