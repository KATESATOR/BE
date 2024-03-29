# actiTIME-automation
Структура проекта:   

features/* - основная папка
 - pages/* - папка в которой хранятся page objects
 - results/* - папка для хранения скриншотов и логов
 - step_definitions/* - папка с шагами для прохождения сценариев
 - tests/* - папка со сценариями тестов
 - utility/* - вспомогательные методы
 - configuration.py - конфигурационный файл
 - environment.py - условия до и после прохождения сценариев
 
Написание тестов:
 
 - сценарии тестов пишутся в файлах .feature в папке tests
 - для каждого интерфейса должен быть создан *page object* (отдельный файл в папке pages)
    - *page object* содержит элементы и их идентификаторы
    - чтобы работать с *page object* его нужно инициализировать в utility/initialization.py
 - методы взаимодействия с элементами пишутся в файле /utility/element.py
    - для того, чтобы методы распространялись на элементы нового *page object* в него нужно сделать импорт: from features.utility.element import*
 - действия шагов сценариев описаны в папке steps
    - желательно, чтобы шаги были универсальными (их можно использовать с разными элементами и на разных интерфейсах)
    - универсальные шаги добавляются в файл main_steps.py
    - не универсальные шаги лучше описать в другом файле
    - названия шагов не должны дублироваться, иначе сценарий не будет понимать к какому шагу обращаться
    
Tips & Tricks:
   
 - для того чтобы посмотреть на что ссылается шаг сценария нужно зажать Ctrl и кликнуть по этому шагу
 - для правильного форматирования файла рекомендуется использовать сочетание клавиш Ctrl+Alt+L
 