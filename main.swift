//
//  main.swift
//  Challenge_apple
//
//  Created by MATEUS ZAVAGLI LELIS DO CARMO on 14/11/25.
//
import Foundation

// Idioma
enum Idioma {
    case pt, en
}
var idioma: Idioma = .pt
func T(_ pt: String, _ en: String) -> String { //Função T para atualizar o idioma nos prints - todo print (que tiver opção para dois idiomas) terá o formato: print("(T("")")
    idioma == .pt ? pt : en
}

//  Jogador
class Jogador {
    var nome: String
    var xp: Int
    var mana: Int
    var feitiços: [String]
    
    init(nome: String) {
        self.nome = nome //self para não chamar o parâmetro, mas sim para chamar o valor presente naquela variável
        self.xp = 0
        self.mana = 0
        self.feitiços = []
    }
}

// ABA - Feitiços Disponíveis
let feitiçosDisponiveis: [(nome: String, xpNecessario: Int, manaNecessaria: Int)] = [
    ("Bola de Fogo  / Fire Ball", 50, 20),
    ("Rajada de Gelo/ Ice Gust", 30, 15),
    ("Toque Sombrio / Dark Touch", 100, 50),
    ("Luz Sagrada / Sacred Light", 250, 100),
    ("Tempestade Arcana / Arcane Storm", 500, 150)
]

//  Entrada
func lerNum() -> Int {
    Int(readLine() ?? "") ?? -1
}
func lerStr() -> String {
    readLine() ?? "Ué?! Nada? 😒"
}

//  ABA - Aprender Feitiços
func aprenderFeitiços(_ j: Jogador) { //j será a variavél que guarda as informações do jogador
    while true {
        print("""
        
        ✨ \(T("APRENDER FEITIÇOS","LEARN SPELLS"))
        XP: \(j.xp) | Mana: \(j.mana)
        
        1 - \(T("Jogar dado (ganhar XP e mana)","Roll dice (gain XP & mana)"))
        2 - \(T("Lista de Feitiços Disponíveis","Available Spells"))
        0 - \(T("Voltar","Back"))
        """)

        print(T("Escolha:","Choose:"))
        let e = lerNum() //Variável `e` para ler o input
        if e == 0 {
            return
        }

        // Jogar dado
        if e == 1 {
            let dado = Int.random(in: 1...10)
            let ganhoXP = dado * 5
            let ganhoMana = dado * 2

            j.xp += ganhoXP
            j.mana += ganhoMana

            print("🎲 \(T("Resultado após rolar dado","Result after dice roller")): \(dado)")
            print("🎉 +\(ganhoXP) XP | 🔵🪬 +\(ganhoMana) Mana")
        }

        // ABA - Lista de feitiços
        else if e == 2 {
            print("\n📜 \(T("FEITIÇOS DISPONÍVEIS","AVAILABLE SPELLS"))")
            for (i, f) in feitiçosDisponiveis.enumerated() {
                print("\(i+1) - \(f.nome) — XP:\(f.xpNecessario), Mana:\(f.manaNecessaria)")
            }
            print("0 - \(T("Voltar","Back"))")

            print(T("Escolha um feitiço para aprender:","Choose a spell to learn:"))
            let n = lerNum()
            if n == 0 {
                continue
            }
            if n < 1 || n > feitiçosDisponiveis.count {
                continue
            }

            let f = feitiçosDisponiveis[n-1]

            if j.xp < f.xpNecessario {
                print(T("❌ XP insuficiente!","❌ Not enough XP!"))
                continue
            }else if j.mana < f.manaNecessaria {
                print(T("❌ Mana insuficiente!","❌ Not enough Mana!"))
                continue
            }else if j.xp < f.xpNecessario && j.mana < f.manaNecessaria{
                print(T("❌ XP  e Mana insuficientes!","❌ Not enough XP and Mana!"))
                continue
            }

            j.xp -= f.xpNecessario
            j.mana -= f.manaNecessaria
            j.feitiços.append(f.nome)

            print("✨ \(T("Você aprendeu","You learned")) \(T(f.nome, f.nome))!")
        }
    }
}

// ABA - Combinar Elementos
func combinarElementos(_ j: Jogador) {
    let combinacoes: [Set<String>: String] = [
        ["Fogo","Ar"]: "Explosão Flamejante - Flaming Explosion",
        ["Gelo","Sombra"]: "Nevasca Sombria - Dark blizzard",
        ["Luz","Ar"]: "Lâmina Celestial - Celestial blade"
    ]

    let elementos = ["Fogo","Gelo","Luz","Sombra","Ar"]

    while true {
        print("""
        
        🧙 \(T("COMBINAR ELEMENTOS","COMBINE ELEMENTS"))
        \(T("Escolha dois elementos para tentar criar um feitiço.","Choose two elements to try a combination."))
        
        Elementos:
        1-Fogo/Fire | 2-Gelo/Ice | 3-Luz/Light | 4-Sombra/Shadow | 5-Ar/Air
        0-\(T("Voltar","Back"))
        """)

        print(T("Primeiro elemento:","First element:"))
        let e1 = lerNum()
        if e1 == 0 {
            return
        }

        print(T("Segundo elemento:","Second element:"))
        let e2 = lerNum()
        if e2 == 0 {
            return }
        

        if e1 < 1 || e1 > 5 || e2 < 1 || e2 > 5 || e1 == e2 {
            print(T("😕Impossível!","😕Impossible!"))
            continue
        }

        let chave = Set([elementos[e1-1], elementos[e2-1]])

        if let feitiço = combinacoes[chave] {
            print("✨ \(T("Você criou","You created")) \(feitiço)!")
            if !j.feitiços.contains(feitiço) {
                j.feitiços.append(feitiço)
            }
        } else {
            print(T("❌ Combinação falhou.","❌ Combination failed."))
        }
    }
}

// ABA - Livro de Feitiços
func livro(_ j: Jogador) {
    print("\n📘 \(T("SEU LIVRO DE FEITIÇOS","YOUR SPELLBOOK"))")
    if j.feitiços.isEmpty {
        print(T("Nenhum feitiço aprendido.","No spells learned yet."))
        return
    }
    for f in j.feitiços {
        print("- \(f)")
    }
}

// Menu
func menu(_ j: Jogador) {
    while true {
        print("""
        
             \(T("MENU PRINCIPAL","MAIN MENU")) 

        1 - \(T("Aprender Feitiços","Learn Spells"))
        2 - \(T("Combinar Elementos","Combine Elements"))
        3 - \(T("Livro de Feitiços","Spellbook"))
        0 - \(T("Encerrar","Exit"))
        """)

        print(T("Escolha:","Choose:"))
        let e = lerNum()

        switch e {
        case 1: aprenderFeitiços(j)
        case 2: combinarElementos(j)
        case 3: livro(j)
        case 0:
            print(T("🏁 Sistema encerrado! Até a próxima! 👋","🏁 System closed! Til' next time 👋!"))
            return
        default: continue
        }
    }
}

// Início do Jogo
print("     🔮 ⭐ ACADEMIA DE MAGIA ⭐ 🔮   ")
print(T("Digite seu nome:","Enter your name:"))
let nome = lerStr()

while true {
    print("\n1 - Português | 2 - English")
    print("Escolha um idioma:  |  Select a Language:")
    let e = lerNum()
    if e == 1 {
        idioma = .pt
         break
    }
    if e == 2 {
         idioma = .en
          break
        }
}

print(T("Bem-vindo(a),","Welcome,"), nome,"!")

let jogador = Jogador(nome: nome)

menu(jogador)
