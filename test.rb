class Character
    attr_reader :name, :hp, :offense, :defense
    def initialize(name,hp,offense,defense)
        @name = name
        @hp = hp
        @offense = offense
        @defense = defense
    end
end

class Brave < Character
    def initialize(name,hp,offense,defense)
        super(name,hp,offense,defense)
    end

    def attack()
        puts "#{name[:name]}の攻撃！"
    end
end

class Monster < Character
    def initialize(name,hp,offense,defense)
        super()
    end
    def attack()
        puts "#{name[:name]}の攻撃！"
    end
end
brave = Brave.new(name: "ゆうしゃ", hp: 238, offense: 203, defense: 129)
monster = Monster.new(name: "アークデーモン", hp: 210, offense: 140, defense: 80)

puts brave.attack()
puts monster.attack()