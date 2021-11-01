class Character
    attr_reader :name, :hp, :offense, :defense
    def initialize(name,hp,offense,defense)
        @name = name
        @hp = hp
        @offense = offense
        @defense = defense
    end

    # def hp?
    #     @hp <= 0
    # end

    # def attacked!(offense)
    #     @hp -= offense
    # end
end

# class Battle < Character
#     attr_reader :character
#     def initialize(brave,monster)
#         @turn_count = 0
#     end

#     def attack

#     end
# end

class Brave < Character
    attr_reader :characters
    def initialize(name,hp,offense,defense)
        super(name,name,hp,offense,defense)
        puts "#{monster.name}があらわれた"
    end

    def attack
        puts "#{brave.name}"
        puts "#{brave.name}の攻撃！"
    end
end

class Monster < Character
    attr_reader :characters    
    def initialize(name,hp,offense,defense)
        super(name,name,hp,offense,defense)
    end

    def attack
        puts "#{monster.name}}があらわれた"
    end
end


brave = Brave.new(name: "ゆうしゃ", hp: 238, offense: 203, defense: 129)
monster = Monster.new(name: "アークデーモン", hp: 210, offense: 140, defense: 80)
brave.attack
monster.attack

