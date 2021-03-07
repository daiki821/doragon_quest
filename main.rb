class Brave
  attr_reader :name, :offense, :defense
  attr_accessor :hp

  SPECIAL_ATTACK_CONSTANT = 1.5

  def initialize(params)
    @name = params[:name]
    @hp = params[:hp]
    @offense = params[:offense]
    @defense = params[:defense]
  end

  def attack(monster)
    attack_num = rand(4)

    if attack_num == 0
      p "#{self.name}の必殺技"
      damege = calculate_special_attack - monster.defense
    else
      p "#{self.name}の攻撃"
      damege = self.offense - monster.defense
    end

    monster.hp -= damege

    p <<~TEXT
      #{self.name}は#{monster.name}に#{damege}のダメージを与えた
      #{monster.name}の残りHPは#{monster.hp}だ
    TEXT
  end

  def calculate_special_attack
    self.offense * SPECIAL_ATTACK_CONSTANT
  end

end

class Monster
  attr_accessor :name, :hp, :transformed, :offense, :defense

  POWER_UP_RATE = 1.5
  CALC_HP_HALF = 0.5
  
  def initialize(params)
    @name = params[:name]
    @hp = params[:hp]
    @offense = params[:offense]
    @defense = params[:defense]
    @transformed =  false
    @hp_half = params[:hp] * CALC_HP_HALF
  end

  def attack(brave)
    if self.hp <= @hp_half && self.transformed == false
      transformation
      damege = self.offense - brave.defense
    else
      damege = self.offense - brave.defense
    end

    brave.hp -= damege

    p <<~TEXT
      #{self.name}は#{brave.name}に#{damege}のダメージを与えた
      #{brave.name}の残りHPは#{brave.hp}だ
    TEXT
  end

  def calculate_special_attack
    self.offense *=  POWER_UP_RATE
  end

  private

  def transformation
    self.transformed = true
    p "#{self.name}は怒った"
    p "#{self.name}はキングスライムに変身した"
    self.name = 'キングスライム'
    calculate_special_attack
  end

end

brave = Brave.new(name: '勇者', hp: 500, offense: 150, defense: 100)
monster = Monster.new(name: 'スライム', hp: 250, offense: 200, defense: 100)

brave.attack(monster)
brave.attack(monster)

monster.attack(brave)
monster.attack(brave)








