class Story < ApplicationRecord
    belongs_to :user
    validates_presence_of :title

    default_scope { where(deleted_at: nil) }
    def story
        update(deleted_at: Time.now)
    end
end
