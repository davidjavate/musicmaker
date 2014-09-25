class Track < ActiveRecord::Base
	has_many :comments, dependent: :destroy
	belongs_to :user

	has_attached_file :file,
	 	:url =>':s3_domain_url',
  		:path => '/:class/:attachment/:id_partition/:style/:filename',
		:storage => :s3,
		:bucket => 'wdifinalprojectdjavate'


	validates_attachment_content_type :file, :content_type => ["audio/mp3", "audio/wav", "audio/pdf", "audio/docx"]

end
