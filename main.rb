# 勇者とモンスターのinfoを生成する
class Character
    attr_reader :name, :hp, :offense, :defense
    def initialize(character)
        @name = character[:name]
        @hp = character[:hp]
        @offense = character[:offense]
        @defense = character[:defense]
    end

    def hp?
        @hp <= 0
    end

    def attacked!(offense)
        @hp -= offense
    end
end


class Brave
    attr_reader :characters
    def initialize(brave,monster)
        @turn_count = 0 
        @players = [brave,monster]
    end

    def attacked!
        print_initial_situation
        puts "アークデーモンがあらわれた"
        loop do
            battle!
            print_initial_situation
            turn_phaze!
            hp_status
            break if game_over?
        end
    end
    private

    # loop処理
    def turn_phaze!
        @turn_count  += 1
        @players.reverse! if @players.size.modulo(@turn_count).even?
    end

    # battle処理
    def battle!
        attacker,defender = @players
        defender.attacked!(attacker.offense)
    end

    def print_initial_situation
        puts @players.map(&:status)
    end

    def hp_status
        puts @players.map(&:status)
    end


#---------------- ↓2回ゆうしゃの攻撃が続くのでそこを修正したい--------------------
# 攻防結果
    def print_initial_situation
        attacker,defender = @players
        puts [
            "#{attacker.name}の攻撃",
            "#{defender.name}は#{attacker.offense - defender.defense / 2}のダメージを受けた！",
            ("#{defender.name}は倒された！" if defender.hp?)
        ]
    end
# --------------------残りHPの表示したい--------------------
    def hp_status
        attacker,defender = @players
        puts [
            "--------------------------------------------------------------------",
            "【#{attacker.name}】 HP: #{attacker.offense - defender.defense / 2}",
            "【#{defender.name}】 HP: #{attacker.offense - defender.defense / 2}",
            "--------------------------------------------------------------------"
        ]
    end

    def game_over?
        @players.find(&:hp?)
    end
end

# 実引数
brave = Character.new(name: "ゆうしゃ", hp: 238, offense: 203, defense: 129)
monster = Character.new(name: "アークデーモン", hp: 210, offense: 140, defense: 80)

battle = Brave.new(brave.clone, monster.clone)
battle.attacked!

# brave.attack
# monster = Monster.new
# monster.attack