class Story < ApplicationRecord
    acts_as_paranoid
    include AASM
    extend FriendlyId
    friendly_id :slug_candidate, use: :slugged

    # relationship
    belongs_to :user
    has_many :comments
    has_many :bookmarks

    validates_presence_of :title

    has_one_attached :cover_image

    # scope
    # default_scope { where(deleted_at: nil) } 被 paranoid 取代
    scope :published_stories, -> { published.with_attached_cover_image.order(created_at: :desc).includes(:user)}

    # instance method
    # def story
    #     update(deleted_at: Time.now)
    # end

    # aasm setup
    aasm(column: 'status', no_direct_assignment: true) do
      state :draft, initial: true
      state :published, :banned

      event :publish do
        transitions from: :draft, to: :published
      end

      event :unpublish do
        transitions from: :published, to: :draft
      end
    end
    def normalize_friendly_id(input)
      input.to_s.to_slug.normalize(transliterations: :russian).to_s
    end
    private
    def slug_candidate
      [
        :title,
        [:title, SecureRandom.hex[0,8]]
      ]
    end
end
