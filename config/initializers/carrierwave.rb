# AWS S3 Settings

if Rails.env.production?
  CarrierWave.configure do |config|
    config.fog_credentials = {
        provider:              'AWS',
        aws_access_key_id:     ENV['S3_ACCESS_KEY'],
        aws_secret_access_key: ENV['S3_SECRET_KEY']
    }

    config.fog_directory  = ENV['S3_BUCKET_NAME']
  end
end

# Google Cloud Storage Settings

# if Rails.env.production?
#   CarrierWave.configure do |config|
#     config.fog_credentials = {
#         provider:              'Google',
#         google_storage_access_key_id:     ENV['GS_ACCESS_KEY_ID'],
#         google_storage_secret_access_key: ENV['GS_SECRET_ACCESS_KEY']
#     }
#
#     config.fog_directory  = ENV['GS_BUCKET_NAME']
#   end
# end
