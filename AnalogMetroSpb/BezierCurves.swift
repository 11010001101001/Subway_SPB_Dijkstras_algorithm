//
//  BezierCurves.swift
//  AnalogMetroSpb
//
//  Created by Admin on 17.08.2021.
//

import UIKit

class BezierCurves: UIView {
    
    
    override func draw(_ rect: CGRect) {
        
        let stackView1 = UIStackView(frame: CGRect(x: 157.5, y: 286, width: 15, height: 32))
        stackView1.axis = .vertical
        stackView1.spacing = 2.0
        stackView1.distribution = .fillEqually
        stackView1.backgroundColor = .white
        stackView1.layer.cornerRadius = stackView1.frame.height/2
        let stackView2 = UIStackView(frame: CGRect(x: 247, y: 286, width: 15, height: 32))
        stackView2.axis = .vertical
        stackView2.spacing = 2.0
        stackView2.distribution = .fillEqually
        stackView2.backgroundColor = .white
        stackView2.layer.cornerRadius = stackView2.frame.height/2
        let stackView3 = UIStackView(frame: CGRect(x: 157.5, y: 330, width: 15, height: 49))
        stackView3.axis = .vertical
        stackView3.spacing = 2.0
        stackView3.distribution = .fillEqually
        stackView3.backgroundColor = .white
        stackView3.layer.cornerRadius = stackView3.frame.height/2
        let stackView4 = UIStackView(frame: CGRect(x: 239, y: 337, width: 15, height: 32))
        stackView4.axis = .vertical
        stackView4.spacing = 2.0
        stackView4.distribution = .fillEqually
        stackView4.backgroundColor = .white
        stackView4.layer.cornerRadius = stackView4.frame.height/2
        let stackView5 = UIStackView(frame: CGRect(x: 298, y: 370, width: 15, height: 32))
        stackView5.axis = .vertical
        stackView5.spacing = 2.0
        stackView5.distribution = .fillEqually
        stackView5.backgroundColor = .white
        stackView5.layer.cornerRadius = stackView5.frame.height/2
        let stackView6 = UIStackView(frame: CGRect(x: 215, y: 390, width: 15, height: 32))
        stackView6.axis = .vertical
        stackView6.spacing = 2.0
        stackView6.distribution = .fillEqually
        stackView6.backgroundColor = .white
        stackView6.layer.cornerRadius = stackView6.frame.height/2
        let stackView7 = UIStackView(frame: CGRect(x: 157.5, y: 445, width: 15, height: 32))
        stackView7.axis = .vertical
        stackView7.spacing = 2.0
        stackView7.distribution = .fillEqually
        stackView7.backgroundColor = .white
        stackView7.layer.cornerRadius = stackView7.frame.height/2
        
        //  рисуем мал станции
        func drawSmallStations(name: String,x:CGFloat, y:CGFloat, color: UIColor, id: Int) {
            
            let station = UIButton(frame: CGRect(x: x, y: y, width: 10, height: 10))
            station.tag = id
            let stationName = UILabel(frame: CGRect(x: x+12, y: y, width: 65, height: 10))
            station.backgroundColor = color
            station.layer.cornerRadius = station.frame.size.height/2
            station.layer.borderWidth = 2
            station.layer.borderColor = UIColor.white.cgColor
            stationName.text = name
            stationName.numberOfLines = 0
            stationName.tintColor = UIColor.black
            stationName.font = .boldSystemFont(ofSize: 6)
            stationName.sizeToFit()
            self.addSubview(station)
            self.addSubview(stationName)
        }
        // рисуем большие станции с переходами
        func drawBigStations(name: String,x: CGFloat, y:CGFloat,color: UIColor, id: Int) {
            
            let station = UIButton(frame: CGRect(x: x, y: y, width: 15, height: 15))
            station.tag = id
            let stationName = UILabel(frame: CGRect(x: x+22, y: y-2, width: 50, height: 10))
            station.backgroundColor = color
            station.layer.cornerRadius = station.frame.size.height/2
            station.layer.borderWidth = 2
            station.layer.borderColor = UIColor.white.cgColor
            stationName.text = name
            stationName.numberOfLines = 0
            stationName.tintColor = UIColor.black
            stationName.font = .boldSystemFont(ofSize: 6)
            stationName.sizeToFit()
            self.addSubview(station)
            self.addSubview(stationName)
            
            switch station.tag {
            case 9:
                stackView1.addArrangedSubview(station)
                self.addSubview(stackView1)
            case 57:
                stackView1.addArrangedSubview(station)
                self.addSubview(stackView1)
            case 28:
                stackView2.addArrangedSubview(station)
                self.addSubview(stackView2)
            case 58:
                stackView2.addArrangedSubview(station)
                self.addSubview(stackView2)
            case 10:
                stackView3.addArrangedSubview(station)
                self.addSubview(stackView3)
            case 44:
                stackView3.addArrangedSubview(station)
                self.addSubview(stackView3)
            case 65:
                stackView3.addArrangedSubview(station)
                self.addSubview(stackView3)
            case 29:
                stackView4.addArrangedSubview(station)
                self.addSubview(stackView4)
            case 66:
                stackView4.addArrangedSubview(station)
                self.addSubview(stackView4)
            case 59:
                stackView5.addArrangedSubview(station)
                self.addSubview(stackView5)
            case 68:
                stackView5.addArrangedSubview(station)
                self.addSubview(stackView5)
            case 30:
                stackView6.addArrangedSubview(station)
                self.addSubview(stackView6)
            case 45:
                stackView6.addArrangedSubview(station)
                self.addSubview(stackView6)
            case 11:
                stackView7.addArrangedSubview(station)
                self.addSubview(stackView7)
            case 31:
                stackView7.addArrangedSubview(station)
                self.addSubview(stackView7)
            default:
                break
            }
        }
        
        // вспомогательные лейблы там, где пересечение станций и нет смысла рисовать новую станцию
        func drawLabel(name:String,x:CGFloat,y:CGFloat,color: UIColor ) {
            let stationName = UILabel(frame: CGRect(x: x, y: y, width: 75, height: 10))
            stationName.text = name
            stationName.numberOfLines = 0
            stationName.textColor = color
            stationName.font = .boldSystemFont(ofSize: 6)
            stationName.sizeToFit()
            self.addSubview(stationName)
        }
        func drawLigovskyProspectStation(name:String,x:CGFloat,y:CGFloat,color: UIColor ) {
            let stationName = UILabel(frame: CGRect(x: x, y: y, width: 50, height: 10))
            stationName.text = name
            stationName.numberOfLines = 0
            stationName.textColor = color
            stationName.font = .boldSystemFont(ofSize: 6)
            stationName.sizeToFit()
            self.addSubview(stationName)
        }
        
        // рисуем синюю ветку - станции, графы, ребра с весами
        let parnas = Station(id: 1, name: "Парнас")
        let parnasV = graph.createVertex(data: parnas)
        drawSmallStations(name: parnas.name,x: 160,y: 24,color: .blue, id: parnas.id)
        
        let prospectProsveshenija = Station(id: 2, name: "Проспект просвещения")
        let prospectProsveshenijaV = graph.createVertex(data: prospectProsveshenija)
        drawSmallStations(name: prospectProsveshenija.name,x: 160,y: 54, color: .blue, id: prospectProsveshenija.id)
        graph.add(from: parnasV, to: prospectProsveshenijaV, weight: 5)
        
        let ozerki = Station(id: 3, name: "Озерки")
        let ozerkiV = graph.createVertex(data: ozerki)
        drawSmallStations(name: ozerki.name,x: 160,y: 84, color: .blue, id: ozerki.id)
        graph.add(from: prospectProsveshenijaV, to: ozerkiV, weight: 4)
        
        let udelnaja = Station(id: 4, name: "Удельная")
        let udelnajaV = graph.createVertex(data: udelnaja)
        drawSmallStations(name: udelnaja.name,x: 160,y: 114, color: .blue, id: udelnaja.id)
        graph.add(from: ozerkiV, to: udelnajaV, weight: 5)
        
        let pionerskaja = Station(id: 5, name: "Пионерская")
        let pionerskajaV = graph.createVertex(data: udelnaja)
        drawSmallStations(name: pionerskaja.name,x: 160,y: 144, color: .blue, id: pionerskaja.id)
        graph.add(from: udelnajaV, to: pionerskajaV, weight: 5)
        
        let chernayaRechka = Station(id: 6, name: "Черная речка")
        let chernayaRechkaV = graph.createVertex(data: chernayaRechka)
        drawSmallStations(name: chernayaRechka.name,x: 160,y: 174, color: .blue, id: chernayaRechka.id)
        graph.add(from: pionerskajaV, to: chernayaRechkaV, weight: 5)
        
        let petrogradskaya = Station(id: 7, name: "Петроградская")
        let petrogradskayaV = graph.createVertex(data: petrogradskaya)
        drawSmallStations(name: petrogradskaya.name,x: 160,y: 224, color: .blue, id: petrogradskaya.id)
        graph.add(from: chernayaRechkaV, to: petrogradskayaV, weight: 6)
        
        let gorkovskaya = Station(id: 8, name: "Горьковская")
        let gorkovskayaV = graph.createVertex(data: gorkovskaya)
        drawSmallStations(name: gorkovskaya.name,x: 160,y: 254, color: .blue, id: gorkovskaya.id)
        graph.add(from: petrogradskayaV, to: gorkovskayaV, weight: 4)
        
        let nevskiyProspect = Station(id: 9, name: "Невский проспект")
        let nevskiyProspectV = graph.createVertex(data: nevskiyProspect)
        drawBigStations(name: "",x: 155, y: 294, color: .blue, id: nevskiyProspect.id)
        drawLabel(name: nevskiyProspect.name, x: 175, y: 290, color: .blue)
        graph.add(from: gorkovskayaV, to: nevskiyProspectV, weight: 6)
        
        let sennayaPloshad = Station(id: 10, name: "Сенная площадь")
        let sennayaPloshadV = graph.createVertex(data: sennayaPloshad)
        drawBigStations(name: "",x: 155, y: 344, color: .blue, id: sennayaPloshad.id)
        drawLabel(name: sennayaPloshad.name, x: 175, y: 335, color: .blue)
        graph.add(from: nevskiyProspectV, to: sennayaPloshadV, weight: 4)
        
        let technologicheskiyInstitut2 = Station(id: 11, name: "Технологический институт 2")
        let technologicheskiyInstitut2V = graph.createVertex(data: technologicheskiyInstitut2)
        drawBigStations(name: "",x: 155, y: 450, color: .blue, id: technologicheskiyInstitut2.id)
        drawLabel(name: technologicheskiyInstitut2.name, x: 95, y: 440, color: .blue)
        graph.add(from: sennayaPloshadV, to: technologicheskiyInstitut2V, weight: 4)
        
        let frunzenskaya = Station(id: 12, name: "Фрунзенская")
        let frunzenskayaV = graph.createVertex(data: frunzenskaya)
        drawSmallStations(name: frunzenskaya.name,x: 160,y: 480, color: .blue, id: frunzenskaya.id)
        graph.add(from: technologicheskiyInstitut2V, to: frunzenskayaV, weight: 4)
        
        let moscovskieVorota = Station(id: 13, name: "Московские ворота")
        let moscovskieVorotaV = graph.createVertex(data: moscovskieVorota)
        drawSmallStations(name: moscovskieVorota.name,x: 160,y: 510, color: .blue, id: moscovskieVorota.id)
        graph.add(from: frunzenskayaV, to: moscovskieVorotaV, weight: 5)
        
        let elektrosila = Station(id: 14, name: "Электросила")
        let elektrosilaV = graph.createVertex(data: elektrosila)
        drawSmallStations(name: elektrosila.name,x: 160,y: 540, color: .blue, id: elektrosila.id)
        graph.add(from: moscovskieVorotaV, to: elektrosilaV, weight: 4)
        
        let parkPobedy = Station(id: 15, name: "Парк Победы")
        let parkPobedyV = graph.createVertex(data: parkPobedy)
        drawSmallStations(name: parkPobedy.name,x: 160,y: 570, color: .blue, id: parkPobedy.id)
        graph.add(from: elektrosilaV, to: parkPobedyV, weight: 4)
        
        let moskovskaya = Station(id: 16, name: "Московская")
        let moskovskayaV = graph.createVertex(data: moskovskaya)
        drawSmallStations(name: moskovskaya.name,x: 160,y: 600, color: .blue, id: moskovskaya.id)
        graph.add(from: parkPobedyV, to: moskovskayaV, weight: 5)
        
        let zvezdnaya = Station(id: 17, name: "Звездная")
        let zvezdnayaV = graph.createVertex(data: zvezdnaya)
        drawSmallStations(name: zvezdnaya.name,x: 160,y: 630, color: .blue, id: zvezdnaya.id)
        graph.add(from: moskovskayaV, to: zvezdnayaV, weight: 7)
        
        let kupchino = Station(id: 18, name: "Купчино")
        let kupchinoV = graph.createVertex(data: kupchino)
        drawSmallStations(name: kupchino.name,x: 160,y: 660, color: .blue, id: kupchino.id)
        graph.add(from: zvezdnayaV, to: kupchinoV, weight: 5)
        
        // рисуем красную ветку - станции
        let devyatkino = Station(id: 19, name: "Девяткино")
        let devyatkinoV = graph.createVertex(data: devyatkino)
        drawSmallStations(name: devyatkino.name,x: 250, y: 50,color: .red, id: devyatkino.id)
        
        let grazhdanskiyProspect = Station(id: 20, name: "Гражданский проспект")
        let grazhdanskiyProspectV = graph.createVertex(data: grazhdanskiyProspect)
        drawSmallStations(name: grazhdanskiyProspect.name,x: 250, y: 80,color: .red, id: grazhdanskiyProspect.id)
        graph.add(from: devyatkinoV, to: grazhdanskiyProspectV, weight: 6)
        
        let akademicheskaya = Station(id: 21, name: "Академическая")
        let akademicheskayaV = graph.createVertex(data: akademicheskaya)
        drawSmallStations(name: akademicheskaya.name,x: 250, y: 110,color: .red, id: akademicheskaya.id)
        graph.add(from: grazhdanskiyProspectV, to: akademicheskayaV, weight: 6)
        
        let politechnicheskaya = Station(id: 22, name: "Политехническая")
        let politechnicheskayaV = graph.createVertex(data: politechnicheskaya)
        drawSmallStations(name: politechnicheskaya.name,x: 250, y: 140,color: .red, id: politechnicheskaya.id)
        graph.add(from: akademicheskayaV, to: politechnicheskayaV, weight: 4)
        
        let ploshadMuzhestva = Station(id: 23, name: "Площадь мужества")
        let ploshadMuzhestvaV = graph.createVertex(data: ploshadMuzhestva)
        drawSmallStations(name: ploshadMuzhestva.name,x: 250, y: 170,color: .red, id: ploshadMuzhestva.id)
        graph.add(from: politechnicheskayaV, to: ploshadMuzhestvaV, weight: 4)
        
        let lesnaya = Station(id: 24, name: "Лесная")
        let lesnayaV = graph.createVertex(data: lesnaya)
        drawSmallStations(name: lesnaya.name,x: 250, y: 200,color: .red, id: lesnaya.id)
        graph.add(from: ploshadMuzhestvaV, to: lesnayaV, weight: 5)
        
        let vyborgskaya = Station(id: 25, name: "Выборгская")
        let vyborgskayaV = graph.createVertex(data: vyborgskaya)
        drawSmallStations(name: vyborgskaya.name,x: 250, y: 220,color: .red, id: vyborgskaya.id)
        graph.add(from: lesnayaV, to: vyborgskayaV, weight: 5)
        
        let ploshadLenina = Station(id: 26, name: "Площадь Ленина")
        let ploshadLeninaV = graph.createVertex(data: ploshadLenina)
        drawSmallStations(name: ploshadLenina.name,x: 250, y: 240,color: .red, id: ploshadLenina.id)
        graph.add(from: vyborgskayaV, to: ploshadLeninaV, weight: 5)
        
        let chernyshevskaya = Station(id: 27, name: "Чернышевская")
        let chernyshevskayaV = graph.createVertex(data: chernyshevskaya)
        drawSmallStations(name: chernyshevskaya.name,x: 250, y: 260,color: .red, id: chernyshevskaya.id)
        graph.add(from: ploshadLeninaV, to: chernyshevskayaV, weight: 5)
        
        let ploshadVosstaniya = Station(id: 28, name: "Площадь восстания")
        let ploshadVosstaniyaV = graph.createVertex(data: ploshadVosstaniya)
        drawBigStations(name: "", x: 245, y: 294, color: .red, id: ploshadVosstaniya.id)
        drawLabel(name: ploshadVosstaniya.name, x: 265, y: 290, color: .red)
        graph.add(from: chernyshevskayaV, to: ploshadVosstaniyaV, weight: 5)
        
        let vladimirskaya = Station(id: 29, name: "Владимирская")
        let vladimirskayaV = graph.createVertex(data: vladimirskaya)
        drawBigStations(name: "", x: 235, y: 344, color: .red, id: vladimirskaya.id)
        drawLabel(name: vladimirskaya.name, x: 257, y: 340, color: .red)
        graph.add(from: ploshadVosstaniyaV, to: vladimirskayaV, weight: 4)
        
        let pushkinskaya = Station(id: 30, name: "Пушкинская")
        let pushkinskayaV = graph.createVertex(data: pushkinskaya)
        drawBigStations(name: "", x: 215, y: 400, color: .red, id: pushkinskaya.id)
        drawLabel(name: pushkinskaya.name, x: 235, y: 400, color: .red)
        graph.add(from: vladimirskayaV, to: pushkinskayaV, weight: 4)
        
        let technologicheskiyInstitut1 = Station(id: 31, name: "Технологический институт 1")
        let technologicheskiyInstitut1V = graph.createVertex(data: technologicheskiyInstitut1)
        drawBigStations(name: "", x: 155, y: 450, color: .red, id: technologicheskiyInstitut1.id)
        drawLabel(name: technologicheskiyInstitut1.name, x: 95, y: 455, color: .red)
        graph.add(from: pushkinskayaV, to: technologicheskiyInstitut1V, weight: 4)
        graph.add(from: technologicheskiyInstitut2V, to: technologicheskiyInstitut1V, weight: 2)
        
        let baltiyskaya = Station(id: 32, name: "Балтийская")
        let baltiyskayaV = graph.createVertex(data: baltiyskaya)
        drawSmallStations(name: "",x: 80, y: 485,color: .red, id: baltiyskaya.id)
        drawLabel(name: baltiyskaya.name, x: 90, y: 490, color: .black)
        graph.add(from: technologicheskiyInstitut1V, to: baltiyskayaV, weight: 4)
        
        let narvskaya = Station(id: 33, name: "Нарвская")
        let narvskayaV = graph.createVertex(data: narvskaya)
        drawSmallStations(name: narvskaya.name,x: 80, y: 510,color: .red, id: narvskaya.id)
        graph.add(from: baltiyskayaV, to: narvskayaV, weight: 5)
        
        let kirovskiyZavod = Station(id: 34, name: "Кировский завод")
        let kirovskiyZavodV = graph.createVertex(data: kirovskiyZavod)
        drawSmallStations(name: kirovskiyZavod.name,x: 80, y: 535,color: .red, id: kirovskiyZavod.id)
        graph.add(from: narvskayaV, to: kirovskiyZavodV, weight: 6)
        
        let avtovo = Station(id: 35, name: "Автово")
        let avtovoV = graph.createVertex(data: avtovo)
        drawSmallStations(name: avtovo.name,x: 80, y: 570,color: .red, id: avtovo.id)
        graph.add(from: kirovskiyZavodV, to: avtovoV, weight: 4)
        
        let leninskiyProspect = Station(id: 36, name: "Ленинский проспект")
        let leninskiyProspectV = graph.createVertex(data: leninskiyProspect)
        drawSmallStations(name: leninskiyProspect.name,x: 80, y: 600,color: .red, id: leninskiyProspect.id)
        graph.add(from: avtovoV, to: leninskiyProspectV, weight: 5)
        
        let prospectVeteranov = Station(id: 37, name: "Проспект Ветеранов")
        let prospectVeteranovV = graph.createVertex(data: prospectVeteranov)
        drawSmallStations(name: prospectVeteranov.name,x: 80, y: 630,color: .red, id: prospectVeteranov.id)
        graph.add(from: leninskiyProspectV, to: prospectVeteranovV, weight: 4)
        
        // рисуем фиолетовую ветку - станции
        let komendantskiyProspect = Station(id: 38, name: "Комендантский проспект")
        let komendantskiyProspectV = graph.createVertex(data: komendantskiyProspect)
        drawSmallStations(name: komendantskiyProspect.name,x: 80,y: 120, color: .purple, id: komendantskiyProspect.id)
        
        let starayaDerevnya = Station(id: 39, name: "Старая деревня")
        let starayaDerevnyaV = graph.createVertex(data: starayaDerevnya)
        drawSmallStations(name: starayaDerevnya.name,x: 80,y: 150, color: .purple, id: starayaDerevnya.id)
        graph.add(from: komendantskiyProspectV, to: starayaDerevnyaV, weight: 6)
        
        let krestovskiyOstrov = Station(id: 40, name: "Крестовский остров")
        let krestovskiyOstrovV = graph.createVertex(data: krestovskiyOstrov)
        drawSmallStations(name: krestovskiyOstrov.name,x: 80,y: 170, color: .purple, id: krestovskiyOstrov.id)
        graph.add(from: starayaDerevnyaV, to: krestovskiyOstrovV, weight: 5)
        
        let chkalovskaya = Station(id: 41, name: "Чкаловская")
        let chkalovskayaV = graph.createVertex(data: chkalovskaya)
        drawSmallStations(name: "",x: 80,y: 190, color: .purple, id: 41)
        graph.add(from: krestovskiyOstrovV, to: chkalovskayaV, weight: 5)
        
        let sportivnaya = Station(id: 42, name: "Спортивная")
        let sportivnayaV = graph.createVertex(data: sportivnaya)
        drawSmallStations(name: sportivnaya.name,x: 80,y: 210, color: .purple, id: sportivnaya.id)
        graph.add(from: chkalovskayaV, to: sportivnayaV, weight: 4)
        
        let admiralteiskaya = Station(id: 43, name: "Адмиралтейская")
        let admiralteiskayaV = graph.createVertex(data: admiralteiskaya)
        drawSmallStations(name: "",x: 120,y: 320, color: .purple, id: admiralteiskaya.id)
        drawLabel(name: admiralteiskaya.name, x: 63, y: 322, color: .black)
        graph.add(from: sportivnayaV, to: admiralteiskayaV, weight: 5)
        
        let sadovaya = Station(id: 44, name: "Садовая")
        let sadovayaV = graph.createVertex(data: sadovaya)
        drawBigStations(name: "",x: 155, y: 344, color: .purple, id: sadovaya.id)
        drawLabel(name: sadovaya.name, x: 125, y: 350, color: .purple)
        graph.add(from: admiralteiskayaV, to: sadovayaV, weight: 4)
        graph.add(from: sennayaPloshadV, to: sadovayaV, weight: 4)
        
        let zvenigorodskaya = Station(id: 45, name: "Звенигородская")
        let zvenigorodskayaV = graph.createVertex(data: zvenigorodskaya)
        drawBigStations(name: "", x: 215, y: 400, color: .purple, id: zvenigorodskaya.id)
        drawLabel(name: zvenigorodskaya.name, x: 235, y: 410, color: .purple)
        graph.add(from: sadovayaV, to: zvenigorodskayaV, weight: 5)
        graph.add(from: pushkinskayaV, to: zvenigorodskayaV, weight: 3)
        
        let obvodniyKanal = Station(id: 46, name: "Обводный канал")
        let obvodniyKanalV = graph.createVertex(data: obvodniyKanal)
        drawSmallStations(name: obvodniyKanal.name,x: 236,y: 440, color: .purple, id: obvodniyKanal.id)
        graph.add(from: zvenigorodskayaV, to: obvodniyKanalV, weight: 5)
        
        let volkovskaya = Station(id: 47, name: "Волховская")
        let volkovskayaV = graph.createVertex(data: volkovskaya)
        drawSmallStations(name: volkovskaya.name,x: 236,y: 510, color: .purple, id: volkovskaya.id)
        graph.add(from: obvodniyKanalV, to: volkovskayaV, weight: 5)
        
        let bucharestskaya = Station(id: 48, name: "Бухарестская")
        let bucharestskayaV = graph.createVertex(data: bucharestskaya)
        drawSmallStations(name: bucharestskaya.name,x: 236,y: 540, color: .purple, id: bucharestskaya.id)
        graph.add(from: volkovskayaV, to: bucharestskayaV, weight: 5)
        
        let mezhdunarodnaya = Station(id: 49, name: "Международная")
        let mezhdunarodnayaV = graph.createVertex(data: mezhdunarodnaya)
        drawSmallStations(name: mezhdunarodnaya.name,x: 236,y: 570, color: .purple, id: mezhdunarodnaya.id)
        graph.add(from: bucharestskayaV, to: mezhdunarodnayaV, weight: 5)
        
        let prospectSlavy = Station(id: 50, name: "Проспект Славы")
        let prospectSlavyV = graph.createVertex(data: prospectSlavy)
        drawSmallStations(name: prospectSlavy.name,x: 236,y: 600, color: .purple, id: prospectSlavy.id)
        graph.add(from: mezhdunarodnayaV, to: prospectSlavyV, weight: 4)
        
        let dunaiskaya = Station(id: 51, name: "Дунайская")
        let dunaiskayaV = graph.createVertex(data: dunaiskaya)
        drawSmallStations(name: dunaiskaya.name,x: 236,y: 630, color: .purple, id: dunaiskaya.id)
        graph.add(from: prospectSlavyV, to: dunaiskayaV, weight: 5)
        
        let shushary = Station(id: 52, name: "Шушары")
        let shusharyV = graph.createVertex(data: shushary)
        drawSmallStations(name: shushary.name,x: 236,y: 660, color: .purple, id: shushary.id)
        graph.add(from: dunaiskayaV, to: shusharyV, weight: 5)
        
        // рисуем зеленую ветку - станции
        let begovaya = Station(id: 53, name: "Беговая")
        let begovayaV = graph.createVertex(data: begovaya)
        drawSmallStations(name: begovaya.name,x: 10,y: 224, color: .green, id: begovaya.id)
        
        let zenit = Station(id: 54, name: "Зенит")
        let zenitV = graph.createVertex(data: zenit)
        drawSmallStations(name: zenit.name,x: 20,y: 244, color: .green, id: zenit.id)
        graph.add(from: begovayaV, to: zenitV, weight: 6)
        
        let primorskaya = Station(id: 55, name: "Приморская")
        let primorskayaV = graph.createVertex(data: primorskaya)
        drawSmallStations(name: primorskaya.name,x: 30,y: 266, color: .green, id: primorskaya.id)
        graph.add(from: zenitV, to: primorskayaV, weight: 6)
        
        let vasileostrovskaya = Station(id: 56, name: "Василеостровская")
        let vasileostrovskayaV = graph.createVertex(data: vasileostrovskaya)
        drawSmallStations(name: "",x: 40,y: 288, color: .green, id: vasileostrovskaya.id)
        drawLabel(name: vasileostrovskaya.name, x: 46, y: 281, color: .black)
        graph.add(from: primorskayaV, to: vasileostrovskayaV, weight: 6)
        
        let gostiniyDvor = Station(id: 57, name: "Гостиный двор")
        let gostiniyDvorV = graph.createVertex(data: gostiniyDvor)
        drawBigStations(name: "",x: 155, y: 294, color: .green, id: gostiniyDvor.id)
        drawLabel(name: gostiniyDvor.name, x: 175, y: 308, color: .green)
        graph.add(from: vasileostrovskayaV, to: gostiniyDvorV, weight: 6)
        graph.add(from: nevskiyProspectV, to: gostiniyDvorV, weight: 4)
        
        let mayakovskaya = Station(id: 58, name: "Маяковская")
        let mayakovskayaV = graph.createVertex(data: mayakovskaya)
        drawBigStations(name: "", x: 245, y: 294, color: .green, id: mayakovskaya.id)
        drawLabel(name: mayakovskaya.name, x: 265, y: 306, color: .green)
        graph.add(from: gostiniyDvorV, to: mayakovskayaV, weight: 5)
        graph.add(from: ploshadVosstaniyaV, to: mayakovskayaV, weight: 3)
        
        let ploshadAlexandraNevskogo1 = Station(id: 59, name: "Площадь Александра Невского 1")
        let ploshadAlexandraNevskogo1V = graph.createVertex(data: ploshadAlexandraNevskogo1)
        drawBigStations(name: "", x: 295, y: 375, color: .green, id: ploshadAlexandraNevskogo1.id)
        drawLabel(name: ploshadAlexandraNevskogo1.name, x: 320, y: 375, color: .green)
        graph.add(from: mayakovskayaV, to: ploshadAlexandraNevskogo1V, weight: 5)
        
        let elizarovskaya = Station(id: 60, name: "Елизаровская")
        let elizarovskayaV = graph.createVertex(data: elizarovskaya)
        drawSmallStations(name: elizarovskaya.name,x: 300,y: 560, color: .green, id: elizarovskaya.id)
        graph.add(from: ploshadAlexandraNevskogo1V, to: elizarovskayaV, weight: 6)
        
        let lomonosovskaya = Station(id: 61, name: "Ломоносовская")
        let lomonosovskayaV = graph.createVertex(data: lomonosovskaya)
        drawSmallStations(name: lomonosovskaya.name,x: 300,y: 590, color: .green, id: lomonosovskaya.id)
        graph.add(from: elizarovskayaV, to: lomonosovskayaV, weight: 5)
        
        let proletarskaya = Station(id: 62, name: "Пролетарская")
        let proletarskayaV = graph.createVertex(data: proletarskaya)
        drawSmallStations(name: proletarskaya.name,x: 300,y: 620, color: .green, id: proletarskaya.id)
        graph.add(from: lomonosovskayaV, to: proletarskayaV, weight: 6)
        
        let obuhovo = Station(id: 63, name: "Обухово")
        let obuhovoV = graph.createVertex(data: obuhovo)
        drawSmallStations(name: obuhovo.name,x: 300,y: 650, color: .green, id: obuhovo.id)
        graph.add(from: proletarskayaV, to: obuhovoV, weight: 5)
        
        let rybatskoe = Station(id: 64, name: "Рыбацкое")
        let rybatskoeV = graph.createVertex(data: rybatskoe)
        drawSmallStations(name: rybatskoe.name,x: 300,y: 680, color: .green, id: rybatskoe.id)
        graph.add(from: obuhovoV, to: rybatskoeV, weight: 6)
        
        // рисуем оранжевую ветку - станции
        let spasskaya = Station(id: 65, name: "Спасская")
        let spasskayaV = graph.createVertex(data: spasskaya)
        drawBigStations(name: "",x: 155, y: 344, color: .orange, id: spasskaya.id)
        drawLabel(name: spasskaya.name, x: 122, y: 368, color: .orange)
        graph.add(from: sennayaPloshadV, to: spasskayaV, weight: 4)
        graph.add(from: sadovayaV, to: spasskayaV, weight: 3)
        
        let dostoevskaya = Station(id: 66, name: "Достоевская")
        let dostoevskayaV = graph.createVertex(data: dostoevskaya)
        drawBigStations(name: "", x: 235, y: 344, color: .orange, id: dostoevskaya.id)
        drawLabel(name: dostoevskaya.name, x: 257, y: 356, color: .orange)
        graph.add(from: spasskayaV, to: dostoevskayaV, weight: 6)
        graph.add(from: vladimirskayaV, to: dostoevskayaV, weight: 3)
        
        let ligovskiyProspect = Station(id: 67, name: "Лиговский проспект")
        let ligovskiyProspectV = graph.createVertex(data: ligovskiyProspect)
        drawSmallStations(name: "",x: 265,y: 375, color: .orange, id: ligovskiyProspect.id)
        drawLigovskyProspectStation(name: ligovskiyProspect.name, x: 237, y: 385, color: .orange)
        graph.add(from: dostoevskayaV, to: ligovskiyProspectV, weight: 4)
        
        let ploshadAlexandraNevskogo2 = Station(id: 68, name: "Площадь Александра Невского 2")
        let ploshadAlexandraNevskogo2V = graph.createVertex(data: ploshadAlexandraNevskogo2)
        drawBigStations(name: "", x: 295, y: 375, color: .orange, id: ploshadAlexandraNevskogo2.id)
        drawLabel(name: ploshadAlexandraNevskogo2.name, x: 320, y: 390, color: .orange)
        graph.add(from: ligovskiyProspectV, to: ploshadAlexandraNevskogo2V, weight: 4)
        graph.add(from: ploshadAlexandraNevskogo1V, to: ploshadAlexandraNevskogo2V, weight: 3)
        
        let novocherkasskaya = Station(id: 69, name: "Новочеркасская")
        let novocherkasskayaV = graph.createVertex(data: novocherkasskaya)
        drawSmallStations(name: novocherkasskaya.name,x: 310,y: 450, color: .orange, id: novocherkasskaya.id)
        graph.add(from: ploshadAlexandraNevskogo2V, to: novocherkasskayaV, weight: 5)
        
        let ladoshzkaya = Station(id: 70, name: "Ладожская")
        let ladoshzkayaV = graph.createVertex(data: ladoshzkaya)
        drawSmallStations(name: ladoshzkaya.name,x: 310,y: 480, color: .orange, id: ladoshzkaya.id)
        graph.add(from: novocherkasskayaV, to: ladoshzkayaV, weight: 5)
        
        let prospectBolshevikov = Station(id: 71, name: "Проспект Большевиков")
        let prospectBolshevikovV = graph.createVertex(data: prospectBolshevikov)
        drawSmallStations(name: prospectBolshevikov.name,x: 310,y: 500, color: .orange, id: prospectBolshevikov.id)
        graph.add(from: ladoshzkayaV, to: prospectBolshevikovV, weight: 5)
        
        let dybenko = Station(id: 72, name: "Дыбенко")
        let dybenkoV = graph.createVertex(data: dybenko)
        drawSmallStations(name: dybenko.name,x: 310,y: 540, color: .orange, id: dybenko.id)
        graph.add(from: prospectBolshevikovV, to: dybenkoV, weight: 5)
        
        // рисуем синюю ветку - пути
        let edgeBlue = UIBezierPath()
        edgeBlue.move(to: CGPoint(x: 165,y: 26))
        edgeBlue.addLine(to: CGPoint(x: 165,y: 54))
        edgeBlue.addLine(to: CGPoint(x: 165,y: 84))
        edgeBlue.addLine(to: CGPoint(x: 165,y: 114))
        edgeBlue.addLine(to: CGPoint(x: 165,y: 144))
        edgeBlue.addLine(to: CGPoint(x: 165,y: 174))
        edgeBlue.addLine(to: CGPoint(x: 165,y: 224))
        edgeBlue.addLine(to: CGPoint(x: 165,y: 254)) // Горьковская
        edgeBlue.addLine(to: CGPoint(x: 165,y: 294))
        edgeBlue.addLine(to: CGPoint(x: 165,y: 344))
        edgeBlue.addLine(to: CGPoint(x: 165,y: 450))
        edgeBlue.addLine(to: CGPoint(x: 165,y: 480))
        edgeBlue.addLine(to: CGPoint(x: 165,y: 510))
        edgeBlue.addLine(to: CGPoint(x: 165,y: 540))
        edgeBlue.addLine(to: CGPoint(x: 165,y: 570))
        edgeBlue.addLine(to: CGPoint(x: 165,y: 600))
        edgeBlue.addLine(to: CGPoint(x: 165,y: 630))
        edgeBlue.addLine(to: CGPoint(x: 165, y: 660))
        UIColor.blue.setFill()
        UIColor.blue.setStroke()
        edgeBlue.lineWidth = 4.0
        edgeBlue.stroke()
        // рисуем красную ветку - пути
        let edgeRed = UIBezierPath()
        edgeRed.move(to: CGPoint(x: 255,y: 52))
        edgeRed.addLine(to: CGPoint(x: 255,y: 80))
        edgeRed.addLine(to: CGPoint(x: 255,y: 110))
        edgeRed.addLine(to: CGPoint(x: 255,y: 140))
        edgeRed.addLine(to: CGPoint(x: 255,y: 170))
        edgeRed.addLine(to: CGPoint(x: 255,y: 200))
        edgeRed.addLine(to: CGPoint(x: 255,y: 220))
        edgeRed.addLine(to: CGPoint(x: 255,y: 240))
        edgeRed.addLine(to: CGPoint(x: 255,y: 260))
        edgeRed.addLine(to: CGPoint(x: 255,y: 305)) // Площадь Восстания
        edgeRed.addLine(to: CGPoint(x: 247,y: 350)) // Владимирская
        edgeRed.addLine(to: CGPoint(x: 225,y: 410)) // Пушкинская
        edgeRed.addLine(to: CGPoint(x: 160,y: 465)) // Техн инст 1
        edgeRed.addLine(to: CGPoint(x: 85,y: 490)) // Балтийская
        edgeRed.addLine(to: CGPoint(x: 85,y: 510))
        edgeRed.addLine(to: CGPoint(x: 85,y: 535))
        edgeRed.addLine(to: CGPoint(x: 85,y: 570))
        edgeRed.addLine(to: CGPoint(x: 85,y: 600))
        edgeRed.addLine(to: CGPoint(x: 85,y: 630))
        UIColor.red.setFill()
        UIColor.red.setStroke()
        edgeRed.lineWidth = 4.0
        edgeRed.stroke()
        // рисуем фиолетовую ветку - пути
        let edgePurple = UIBezierPath()
        edgePurple.move(to: CGPoint(x: 85, y: 122))
        edgePurple.addLine(to: CGPoint(x: 85, y: 150))
        edgePurple.addLine(to: CGPoint(x: 85, y: 170))
        edgePurple.addLine(to: CGPoint(x: 85, y: 190))
        edgePurple.addLine(to: CGPoint(x: 85, y: 215)) // Спортивная
        edgePurple.addLine(to: CGPoint(x: 125, y: 325)) // адмиралтейская
        edgePurple.addLine(to: CGPoint(x: 160, y: 350)) // садовая
        edgePurple.addLine(to: CGPoint(x: 220, y: 405)) // Звенигородская
        edgePurple.addLine(to: CGPoint(x: 241, y: 442)) // Обводный канал
        edgePurple.addLine(to: CGPoint(x: 241, y: 510))
        edgePurple.addLine(to: CGPoint(x: 241, y: 540))
        edgePurple.addLine(to: CGPoint(x: 241, y: 570))
        edgePurple.addLine(to: CGPoint(x: 241, y: 600))
        edgePurple.addLine(to: CGPoint(x: 241, y: 630))
        edgePurple.addLine(to: CGPoint(x: 241, y: 660)) // шушары
        UIColor.purple.setFill()
        UIColor.purple.setStroke()
        edgePurple.lineWidth = 4.0
        edgePurple.stroke()
        // рисуем зеленую ветку - пути
        let edgeGreen = UIBezierPath()
        edgeGreen.move(to: CGPoint(x: 13, y: 226)) // Беговая
        edgeGreen.addLine(to: CGPoint(x: 22, y: 244))
        edgeGreen.addLine(to: CGPoint(x: 33, y: 266))
        edgeGreen.addLine(to: CGPoint(x: 45, y: 294))
        edgeGreen.addLine(to: CGPoint(x: 160, y: 303))
        edgeGreen.addLine(to: CGPoint(x: 255, y: 303)) // Маяковская
        edgeGreen.addLine(to: CGPoint(x: 305, y: 380))
        edgeGreen.addLine(to: CGPoint(x: 305, y: 560)) // елизаровская
        edgeGreen.addLine(to: CGPoint(x: 305, y: 590))
        edgeGreen.addLine(to: CGPoint(x: 305, y: 620))
        edgeGreen.addLine(to: CGPoint(x: 305, y: 650))
        edgeGreen.addLine(to: CGPoint(x: 305, y: 680)) // рыбацкое
        UIColor.green.setFill()
        UIColor.green.setStroke()
        edgeGreen.lineWidth = 4.0
        edgeGreen.stroke()
        // рисуем оранжевую ветку - пути
        let edgeOrange = UIBezierPath()
        edgeOrange.move(to: CGPoint(x: 160, y: 354)) // Спасская
        edgeOrange.addLine(to: CGPoint(x: 245, y: 354)) // Достоевская
        edgeOrange.addLine(to: CGPoint(x: 270, y: 380)) // Лиговский проспект
        edgeOrange.addLine(to: CGPoint(x: 305, y: 385)) // площадь Ал Невского 2
        edgeOrange.addLine(to: CGPoint(x: 315, y: 450))
        edgeOrange.addLine(to: CGPoint(x: 315, y: 480))
        edgeOrange.addLine(to: CGPoint(x: 315, y: 500))
        edgeOrange.addLine(to: CGPoint(x: 315, y: 540))
        UIColor.orange.setFill()
        UIColor.orange.setStroke()
        edgeOrange.lineWidth = 4.0
        edgeOrange.stroke()
        
        
        print(findPath(from: parnasV, to: ozerkiV))
        
    }
    
}


