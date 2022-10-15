class Task < ApplicationRecord
    validates :title, length: {maximum: 20}, presence: true
    validates :start, presence: true
    validates :finish, presence: true
    validate :start_should_be_before_finish
    validate :start_should_be_after_today, on: :create

    private
    def start_should_be_before_finish
        return unless start && finish
        if start >= finish
            errors.add(:start, "は終了日よりも前に設定してください")
        end
    end

    def start_should_be_after_today
        return unless start
        if start < Time.zone.now
            errors.add(:start, "は今日以降に選択してください")
        end
    end
end
