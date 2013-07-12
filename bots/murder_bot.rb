class MurderBot < RTanque::Bot::Brain
  NAME = 'murder_bot'
  include RTanque::Bot::BrainHelper

  def tick!
    command.speed = MAX_BOT_SPEED
    targets = self.sensors.radar.to_a
    if targets.any?
      self.command.radar_heading = targets.first.heading
      self.command.heading = targets.first.heading
      self.command.fire
    else
      self.command.radar_heading = self.sensors.radar_heading + MAX_RADAR_ROTATION
    end
    self.command.turret_heading = self.sensors.radar_heading
  end
end
