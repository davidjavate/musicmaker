# Paperclip::Attachment.default_options[:s3_host_name] = 's3.amazonaws.com'
# Paperclip::Attachment.default_options[:s3_host_name] = 's3-us-west-2.amazonaws.com'
Paperclip::Attachment.default_options[:url] = ':s3_domain_url'
# Paperclip::Attachment.default_options[:s3_host_name] = 'wdifinalprojectdjavate.s3.amazonaws.com'
Paperclip::Attachment.default_options[:path] = '/:class/:attachment/:id_partition/:style/:filename'

AWS.config(
access_key_id: ENV['S3_ACCESS_KEY_ID'],
secret_access_key: ENV['S3_SECRET_ACCESS_KEY']
)

s3 = AWS::S3.new

