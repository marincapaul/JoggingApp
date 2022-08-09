class Run < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :distance, presence: true, numericality: { only_float: true }
  validates :time, presence: true, numericality: { only_integer: true }

  # returns a string with the speed in minutes / seconds
  def get_pace 
    time_s = self.time.to_i * 60
    distance_m = self.distance.to_f * 1000
    speed = distance_m / time_s
    total_seconds = 1000/speed
    minutes, seconds = total_seconds.divmod(60)
    seconds = seconds.round < 10 ? "0#{seconds.round}" : "#{seconds.round}"
    "#{minutes}:#{seconds}"
  end

end
