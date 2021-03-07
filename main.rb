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
    attack_type = decision_attack_type

    damege = calculate_damage(attack_type: attack_type, target: monster)

    cause_damage(target: monster, damege: damege)
  end

  private
    def calculate_damage(**params)
      attack_type = params[:attack_type]
      monster = params[:target]

      if attack_type == 'special_attack'
        p "#{self.name}の必殺技"
        calculate_special_attack - monster.defense
      else
        p "#{self.name}の攻撃"
        self.offense - monster.defense
      end

    end

    def calculate_special_attack
      self.offense * SPECIAL_ATTACK_CONSTANT
    end

    def decision_attack_type
      attack_num = rand(4)
      if attack_num == 0
        'special_attack'
      else
        'normal_attack'
      end
    end

    def cause_damage(**params)
      monster = params[:target]
      damege = params[:damege]

      monster.hp -= damege

      monster.hp = 0 if monster.hp <= 0
      
      p <<~TEXT
        #{self.name}は#{monster.name}に#{damege}のダメージを与えた
        #{monster.name}の残りHPは#{monster.hp}だ
      TEXT
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
    @transformed = false
    @hp_half = params[:hp] * CALC_HP_HALF
  end

  def attack(brave)
    damege = has_transformed?(hp_half: @hp_half, target: brave)

    cal_damage(damege: damege, target: brave)
  end



  private

  def has_transformed?(**params)
    hp_half = params[:hp_half]
    brave = params[:target]

    if self.hp <= hp_half && self.transformed == false
      transformation
      self.offense - brave.defense
    else
      self.offense - brave.defense
    end
  end

  def cal_damage(**params)
    damege = params[:damege]
    brave = params[:target]

    brave.hp -= damege

    brave.hp = 0 if brave.hp <= 0

    p <<~TEXT
    #{self.name}は#{brave.name}に#{damege}のダメージを与えた
    #{brave.name}の残りHPは#{brave.hp}だ
  TEXT
  end

  def calculate_special_attack
    self.offense *=  POWER_UP_RATE
  end

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

loop do
  brave.attack(monster)
  if monster.hp <= 0
    break
  end
  monster.attack(brave)
  if brave.hp <= 0
    break
  end
end


