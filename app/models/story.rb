class Story < ApplicationRecord
    include AASM

    belongs_to :user
    validates_presence_of :title

    default_scope { where(deleted_at: nil) }
    def story
        update(deleted_at: Time.now)
    end

    # aasm setup
    aasm(column: 'status') do
      state :draft, initial: true
      state :published, :banned

      event :publish do
        transitions from: :draft, to: :published
      end

      event :unpublish do
        transitions from: :published, to: :draft
      end
    end
end
