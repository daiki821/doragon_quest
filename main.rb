class Brave
  attr_reader :name, :offense, :defense
  attr_accessor :hp


  def initialize(params)
    @name = params[:name]
    @hp = params[:hp]
    @offense = params[:offense]
    @defense = params[:defense]
  end

end

brave = Brave.new(name: '勇者', hp: 1000, offense: 800, defense: 600)




p <<~TEXT
  NAME:#{brave.name}
  HP:#{brave.hp}
  OFFENSE:#{brave.offense}
  DEFENSE:#{brave.defense}
TEXT


brave.hp -= 30


p "#{brave.name}はダメージを受けた!残りHPは#{brave.hp}だ"