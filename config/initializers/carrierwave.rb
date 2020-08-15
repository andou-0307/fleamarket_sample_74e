CarrierWave.configure do |config|
  if Rails.env.production?
    config.strage = :fog
    config.fog_provider = 'fog/aws'
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: Rails.application.credentials.aws[:access_key_id],
      aws_secret_access_key: Rails.application.credentials.aws[:secret_access_key],
      region: 'ap-northeast-1'
    }
    config.fog_directory  = 'code-playmaker'
    config.asset_host = 'https//s3-ap-northeast-1.amazonaws.com/code-playmaker'
  else
    config.storage :file
    config.enable_processing = false if Rails.env.test?
  end
end