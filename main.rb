class Brave
  attr_reader :name, :offense, :defense
  attr_accessor :hp


  def initialize(params)
    @name = params[:name]
    @hp = params[:hp]
    @offense = params[:offense]
    @defense = params[:defense]
  end

  def attack(target)
    damege = self.offense - target.defense
    target.hp -= damege
    p <<~TEXT
      #{self.name}は#{target.name}に#{damege}のダメージを与えた
      #{target.name}の残りHPは#{target.hp}だ
    TEXT
  end

end

class Monster
  attr_reader :name, :offense, :defense
  attr_accessor :hp

  def initialize(params)
    @name = params[:name]
    @hp = params[:hp]
    @offense = params[:offense]
    @defense = params[:defense]
  end
end

brave = Brave.new(name: '勇者', hp: 500, offense: 150, defense: 100)
monster = Monster.new(name: 'スライム', hp: 250, offense: 200, defense: 100)

brave.attack(monster)







