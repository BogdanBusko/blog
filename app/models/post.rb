class Post
  include Mongoid::Document
  include Mongoid::Timestamps


  belongs_to :user
  has_many :comments

  field :title, type: String
  field :text,  type: String

  def self.search(search)
    if search
      where(title: /.*#{search}.*/i).order_by(created_at: :desc)
    else
      order_by(created_at: :desc)
    end

  end
end
