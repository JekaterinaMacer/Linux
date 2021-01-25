#################################################################### Bash
# пример запуска скрипта
cat > script1.sh
#!/bin/bash
echo It works! # code comment sample
echo "Working dir: " $(pwd)
echo "User name: " $USER
echo "OS: " $(uname)
Ctrl+d


# Добавляем разрешение на выполнение
chmod +x script1.sh

# Проверяем
ls -l

# Запускаем
./script1.sh

#################################################################### Циклы
# Цикл for in
for char in {1..10}; do echo $char; done

for n in {1..4}
  do 
    echo "Linux является одной из самых безопасных операционных систем"
  done

# Если вам необходимо часто использовать такую конструкцию, тогда не помешает 
# создать соответствующую bash-функцию (добавьте в ~/.bashrc)
function run() {
	number=$1
	shift
	for n in $(seq $number); do
  	$@
	done
}

# run 5 <КОМАНДА>

# Пример
run 5 echo "Я умею использовать операционную систему Windows Server Standart 2012 R2"

#################################################################### Условия
# скрипт, проверяющий введенный возраст и выдающий соответствующее приветствие
cat > age_check
#!/bin/bash
if [ $1 == 18 ]; then
	echo "Предъявите документы"
elif [ $1 -lt 18 ]; then
	echo "Вход только для взрослых"
elif [ $1 -gt 18 ]; then
	echo "Добро пожаловать"
fi

# запустим скрипт с разными параметрами
bash age_check 10
bash age_check 18
bash age_check 20

#################################################################### Условия
nano burger_cost

#!/bin/bash
case $1 in
  10)
    echo "Дайте два!"
    ;;
  100)
    echo "Хорошо,  спасибо"
    ;;
  50 | 60)
    echo "Колу со льдом, пожалуйста!"
    ;;
  *)
    echo "Что, простите?"
    ;;
esac

# запуск
bash burger_cost 10
bash burger_cost 50
bash burger_cost 100
bash burger_cost asdfas

#################################################################### Циклы
# Цикл while

# Цикл while будет в работе, пока условие, заданное в списке команды 1, будет верным
y=1
while [ $y -lt 10 ]
do
  echo $y
  y=$(( $y + 1 ))
done


#################################################################### Цикл until
# Пример цикла until
#!/bin/bash
POINTER=20
until [ $POINTER -lt 10 ]
do
  echo POINTER $POINTER
  let POINTER-=1
done


#################################################################### Настройка планировщика Cron в Linux
# справка
crontab --help

# просмотр списка заплалнированных команд текущего пользователя
crontab -l

# редактирование списка задач текущего пользователя
crontab –e

# удаление списка задач текущего пользователя
crontab -r

# шпаргалка по синтаксису
# Example of job definition:
# .---------------- minute (0 - 59)
# |  .------------- hour (0 - 23)
# |  |  .---------- day of month (1 - 31)
# |  |  |  .------- month (1 - 12) OR jan,feb,mar,apr ...
# |  |  |  |  .---- day of week (0 - 6) (Sunday=0 or 7) OR sun,mon,tue,wed,thu,fri,sat
# |  |  |  |  |
# *  *  *  *  * [user-name]  command to be executed

# сайт тренажера
https://crontab.guru/

# примеры cron из методички
# Выполнять задание в 19 часов 5 минут 15 мая, если это пятница
5 19 15 5 5 /var/www_mysite/myssqlss.pl

# Выполнять задание раз в два часа в 10 минут текущего часа 
# (то есть в 00:10, 02:10, 04:10 и т.д.)
10 */2 * * * /var/www_mysite/mysql_script.pl

# Выполнять задание каждые десять часов в 10 минут текущего часа 
# (то есть в 00:10, 10:10 и т.д.)
10 */10 * * /var/www_mysite/exescripts.pl

# Выполнять задание по воскресеньям в 12 часов 26 минут:
26 12 * * 0 /var/www_mysite/myscript.sh

# Выполнять в 10 утра каждый день:
0 10 * * * /var/www_mysite/myscript.sh

# путь к файлу с задачами cron для текущего пользователя
sudo cat /var/spool/cron/crontabs/student

# системные задачи лежат в файле
cat /etc/crontab

# просмотр логов 
grep cron /var/log/syslog

+++++++++++++++
Сравнение в Bash
http://tldp.org/LDP/abs/html/comparison-ops.html
Сайт-тренажер планировщика задач cron:
https://crontab.guru/
