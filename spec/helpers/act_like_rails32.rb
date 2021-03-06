class ActLikeRails32
  def self.switch_on
    Trackman::Assets::Components::AssetFactory.module_eval do
      alias :old_asset_pipeline_enabled? :asset_pipeline_enabled?
      
      define_method :asset_pipeline_enabled? do
        true
      end
    end
  end

  def self.switch_off
    Trackman::Assets::Components::AssetFactory.module_eval do
      alias :asset_pipeline_enabled? :old_asset_pipeline_enabled?
      remove_method :old_asset_pipeline_enabled?
    end
  end
end