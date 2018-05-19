# Описание 
Многие знают об обновленном оффмемберсе Samp-Rp, но не многие знают, насколько он неудобен для пользования. Неудобно искать людей, неудобно выделять неактивщиков/задротов, неудобно заполнять состав на форуме, неудобно листать страницы (особенно когда их 20+, а в оффмемберсе больше 1000 игроков).  
К счастью, новый /offmembers легко спарсить, для чего и был написан этот скрипт.  
Скрипт предназначен для лидеров/замов Samp-Rp. С ним у вас появится возможность сохранять /offmembers в .log с кучей разных сортировок, искать игрока в /offmembers по нику, порядковому номеру или ID, выводить списки игроков с заданным рангом / списки неактивщиков, искать по всему оффмемберсу нужных вам людей. Забудьте про пролистывание страниц.  

**Требования:** [CLEO 4.3](http://cleo.li/?lang=ru), [SAMPFUNCS 5.3.3](https://blast.hk/threads/17/), [MoonLoader](https://blast.hk/threads/13305/).  
**Активация:** Скрипт активируется автоматически.

* /om - открыть диалог скрипта с командами.

**Автор:** [rubbishman (James_Bond / Phil_Coulson)](http://rubbishman.ru/samp).

# Скриншоты
![https://i.imgur.com/2csUPN3.jpg?1](https://i.imgur.com/2csUPN3.jpg?1)  
![https://i.imgur.com/dPALth7.jpg?2](https://i.imgur.com/dPALth7.jpg?2)  
![https://i.imgur.com/1SVqSJ5.jpg?1](https://i.imgur.com/1SVqSJ5.jpg?1)  
![https://i.imgur.com/C98oG1I.jpg?2](https://i.imgur.com/C98oG1I.jpg?2)  
# Пример работы
```
OFFMEMBERS LOG 02.12.2017 22:43:17

Logged with /om 1.1 by Narvell & rubbishman

Автор: Narvell (Neax_Wayne) - http://narvell.pw/
Автор: rubbishman (James_Bond Phil_Coulson) - http://rubbishman.ru/samp

1. Исходный текст.
2. Форматирование "Классное" (сортировка по порядковому номеру).
3. Форматирование "Классное" (сортировка по активности за сутки).
4. Форматирование "Классное" (сортировка по активности за неделю).
5. Форматирование "Классное" (сортировка по дате последнего захода).
6. Форматирование "Классное" (сортировка по рангу, ранг по порядковому номеру).
7. Форматирование "Классное" (сортировка по рангу, ранг по активности за сутки).
8. Форматирование "Классное" (сортировка по рангу, ранг по активности за неделю).
9. Форматирование "Классное" (сортировка по рангу, ранг по дате последнего захода).


1. Исходный текст:
[0] James_Bond     9     2017/12/02 18:13:59     2 / 288 часов
[1] Vittore_Deltoro     3     2017/09/12 09:38:34     0 / 0 часов
[2] Alan_Morgan     4     2017/11/19 16:41:37     0 / 52 часов
[3] Francesco_Garsia     8     2017/12/02 17:53:16     5 / 132 часов
[4] Alex_Rein     6     2017/11/30 22:22:44     0 / 129 часов
[5] Chester_Phillips     5     2017/11/26 16:43:43     0 / 83 часов
[6] Alejandro_Sauce     4     2017/12/01 18:07:10     0 / 44 часов
[7] Quentin_Buratino     4     2017/12/02 12:43:54     0 / 51 часов
[8] Jax_Teller     3     2017/12/02 09:42:06     0 / 36 часов
[9] Daniel_Defo     3     2017/11/12 22:12:01     0 / 7 часов
[10] Mike_Rein     7     2017/12/02 18:22:51     3 / 41 часов
[11] Igor_Strelkov     2     2017/11/24 19:15:07     0 / 17 часов
[12] Dwight_Forester     3     2017/12/02 12:01:06     0 / 1 часов
[13] Ramzes_Galager     4     2017/12/02 16:08:36     1 / 54 часов
[14] Morgan_Egorov     3     2017/12/01 23:23:52     0 / 2 часов
[15] Oliver_Bryant     1     2017/12/02 18:42:35     0 / 4 часов
[16] Rolling_Stoner     1     2017/12/01 12:41:10     0 / 7 часов
[17] Charles_Mordecai     3     2017/11/30 17:23:16     0 / 12 часов
[18] Biggie_Shakur     3     2017/12/02 18:10:14     0 / 27 часов
[19] Benjamin_Fairless     3     2017/11/30 19:28:27     0 / 2 часов
[20] Jayden_Williams     1     2017/12/02 18:27:33     1 / 10 часов
[21] Supsqwizzy_Kreslo     1     2017/12/01 18:10:32     0 / 3 часов
[22] Leonardo_Soprano     4     2017/12/02 18:01:21     0 / 15 часов
[23] Andres_Clemente     3     2017/12/01 10:14:32     0 / 0 часов
[24] Jimmy_Carter     3     2017/12/02 12:45:25     0 / 0 часов




2. Форматирование "Классное" (сортировка по порядковому номеру):
[0] James_Bond            . Ранг: 9. Заходил: 2017/12/02 18:13:59. Часов: 2 / 288.
[1] Vittore_Deltoro       . Ранг: 3. Заходил: 2017/09/12 09:38:34. Часов: 0 / 0.
[2] Alan_Morgan           . Ранг: 4. Заходил: 2017/11/19 16:41:37. Часов: 0 / 52.
[3] Francesco_Garsia      . Ранг: 8. Заходил: 2017/12/02 17:53:16. Часов: 5 / 132.
[4] Alex_Rein             . Ранг: 6. Заходил: 2017/11/30 22:22:44. Часов: 0 / 129.
[5] Chester_Phillips      . Ранг: 5. Заходил: 2017/11/26 16:43:43. Часов: 0 / 83.
[6] Alejandro_Sauce       . Ранг: 4. Заходил: 2017/12/01 18:07:10. Часов: 0 / 44.
[7] Quentin_Buratino      . Ранг: 4. Заходил: 2017/12/02 12:43:54. Часов: 0 / 51.
[8] Jax_Teller            . Ранг: 3. Заходил: 2017/12/02 09:42:06. Часов: 0 / 36.
[9] Daniel_Defo           . Ранг: 3. Заходил: 2017/11/12 22:12:01. Часов: 0 / 7.
[10] Mike_Rein            . Ранг: 7. Заходил: 2017/12/02 18:22:51. Часов: 3 / 41.
[11] Igor_Strelkov        . Ранг: 2. Заходил: 2017/11/24 19:15:07. Часов: 0 / 17.
[12] Dwight_Forester      . Ранг: 3. Заходил: 2017/12/02 12:01:06. Часов: 0 / 1.
[13] Ramzes_Galager       . Ранг: 4. Заходил: 2017/12/02 16:08:36. Часов: 1 / 54.
[14] Morgan_Egorov        . Ранг: 3. Заходил: 2017/12/01 23:23:52. Часов: 0 / 2.
[15] Oliver_Bryant        . Ранг: 1. Заходил: 2017/12/02 18:42:35. Часов: 0 / 4.
[16] Rolling_Stoner       . Ранг: 1. Заходил: 2017/12/01 12:41:10. Часов: 0 / 7.
[17] Charles_Mordecai     . Ранг: 3. Заходил: 2017/11/30 17:23:16. Часов: 0 / 12.
[18] Biggie_Shakur        . Ранг: 3. Заходил: 2017/12/02 18:10:14. Часов: 0 / 27.
[19] Benjamin_Fairless    . Ранг: 3. Заходил: 2017/11/30 19:28:27. Часов: 0 / 2.
[20] Jayden_Williams      . Ранг: 1. Заходил: 2017/12/02 18:27:33. Часов: 1 / 10.
[21] Supsqwizzy_Kreslo    . Ранг: 1. Заходил: 2017/12/01 18:10:32. Часов: 0 / 3.
[22] Leonardo_Soprano     . Ранг: 4. Заходил: 2017/12/02 18:01:21. Часов: 0 / 15.
[23] Andres_Clemente      . Ранг: 3. Заходил: 2017/12/01 10:14:32. Часов: 0 / 0.
[24] Jimmy_Carter         . Ранг: 3. Заходил: 2017/12/02 12:45:25. Часов: 0 / 0.



3. Форматирование "Классное" (сортировка по активности за сутки):
001. [3] Francesco_Garsia      . Ранг: 8. Заходил: 2017/12/02 17:53:16. Часов: 5 / 132.
002. [10] Mike_Rein            . Ранг: 7. Заходил: 2017/12/02 18:22:51. Часов: 3 / 41.
003. [0] James_Bond            . Ранг: 9. Заходил: 2017/12/02 18:13:59. Часов: 2 / 288.
004. [20] Jayden_Williams      . Ранг: 1. Заходил: 2017/12/02 18:27:33. Часов: 1 / 10.
005. [13] Ramzes_Galager       . Ранг: 4. Заходил: 2017/12/02 16:08:36. Часов: 1 / 54.
006. [19] Benjamin_Fairless    . Ранг: 3. Заходил: 2017/11/30 19:28:27. Часов: 0 / 2.
007. [15] Oliver_Bryant        . Ранг: 1. Заходил: 2017/12/02 18:42:35. Часов: 0 / 4.
008. [22] Leonardo_Soprano     . Ранг: 4. Заходил: 2017/12/02 18:01:21. Часов: 0 / 15.
009. [21] Supsqwizzy_Kreslo    . Ранг: 1. Заходил: 2017/12/01 18:10:32. Часов: 0 / 3.
010. [16] Rolling_Stoner       . Ранг: 1. Заходил: 2017/12/01 12:41:10. Часов: 0 / 7.
011. [14] Morgan_Egorov        . Ранг: 3. Заходил: 2017/12/01 23:23:52. Часов: 0 / 2.
012. [17] Charles_Mordecai     . Ранг: 3. Заходил: 2017/11/30 17:23:16. Часов: 0 / 12.
013. [18] Biggie_Shakur        . Ранг: 3. Заходил: 2017/12/02 18:10:14. Часов: 0 / 27.
014. [12] Dwight_Forester      . Ранг: 3. Заходил: 2017/12/02 12:01:06. Часов: 0 / 1.
015. [11] Igor_Strelkov        . Ранг: 2. Заходил: 2017/11/24 19:15:07. Часов: 0 / 17.
016. [4] Alex_Rein             . Ранг: 6. Заходил: 2017/11/30 22:22:44. Часов: 0 / 129.
017. [2] Alan_Morgan           . Ранг: 4. Заходил: 2017/11/19 16:41:37. Часов: 0 / 52.
018. [1] Vittore_Deltoro       . Ранг: 3. Заходил: 2017/09/12 09:38:34. Часов: 0 / 0.
019. [23] Andres_Clemente      . Ранг: 3. Заходил: 2017/12/01 10:14:32. Часов: 0 / 0.
020. [5] Chester_Phillips      . Ранг: 5. Заходил: 2017/11/26 16:43:43. Часов: 0 / 83.
021. [7] Quentin_Buratino      . Ранг: 4. Заходил: 2017/12/02 12:43:54. Часов: 0 / 51.
022. [6] Alejandro_Sauce       . Ранг: 4. Заходил: 2017/12/01 18:07:10. Часов: 0 / 44.
023. [9] Daniel_Defo           . Ранг: 3. Заходил: 2017/11/12 22:12:01. Часов: 0 / 7.
024. [8] Jax_Teller            . Ранг: 3. Заходил: 2017/12/02 09:42:06. Часов: 0 / 36.
025. [24] Jimmy_Carter         . Ранг: 3. Заходил: 2017/12/02 12:45:25. Часов: 0 / 0.



4. Форматирование "Классное" (сортировка по активности за неделю):
001. [0] James_Bond            . Ранг: 9. Заходил: 2017/12/02 18:13:59. Часов: 2 / 288.
002. [3] Francesco_Garsia      . Ранг: 8. Заходил: 2017/12/02 17:53:16. Часов: 5 / 132.
003. [4] Alex_Rein             . Ранг: 6. Заходил: 2017/11/30 22:22:44. Часов: 0 / 129.
004. [5] Chester_Phillips      . Ранг: 5. Заходил: 2017/11/26 16:43:43. Часов: 0 / 83.
005. [13] Ramzes_Galager       . Ранг: 4. Заходил: 2017/12/02 16:08:36. Часов: 1 / 54.
006. [2] Alan_Morgan           . Ранг: 4. Заходил: 2017/11/19 16:41:37. Часов: 0 / 52.
007. [7] Quentin_Buratino      . Ранг: 4. Заходил: 2017/12/02 12:43:54. Часов: 0 / 51.
008. [6] Alejandro_Sauce       . Ранг: 4. Заходил: 2017/12/01 18:07:10. Часов: 0 / 44.
009. [10] Mike_Rein            . Ранг: 7. Заходил: 2017/12/02 18:22:51. Часов: 3 / 41.
010. [8] Jax_Teller            . Ранг: 3. Заходил: 2017/12/02 09:42:06. Часов: 0 / 36.
011. [18] Biggie_Shakur        . Ранг: 3. Заходил: 2017/12/02 18:10:14. Часов: 0 / 27.
012. [11] Igor_Strelkov        . Ранг: 2. Заходил: 2017/11/24 19:15:07. Часов: 0 / 17.
013. [22] Leonardo_Soprano     . Ранг: 4. Заходил: 2017/12/02 18:01:21. Часов: 0 / 15.
014. [17] Charles_Mordecai     . Ранг: 3. Заходил: 2017/11/30 17:23:16. Часов: 0 / 12.
015. [20] Jayden_Williams      . Ранг: 1. Заходил: 2017/12/02 18:27:33. Часов: 1 / 10.
016. [16] Rolling_Stoner       . Ранг: 1. Заходил: 2017/12/01 12:41:10. Часов: 0 / 7.
017. [9] Daniel_Defo           . Ранг: 3. Заходил: 2017/11/12 22:12:01. Часов: 0 / 7.
018. [15] Oliver_Bryant        . Ранг: 1. Заходил: 2017/12/02 18:42:35. Часов: 0 / 4.
019. [21] Supsqwizzy_Kreslo    . Ранг: 1. Заходил: 2017/12/01 18:10:32. Часов: 0 / 3.
020. [19] Benjamin_Fairless    . Ранг: 3. Заходил: 2017/11/30 19:28:27. Часов: 0 / 2.
021. [14] Morgan_Egorov        . Ранг: 3. Заходил: 2017/12/01 23:23:52. Часов: 0 / 2.
022. [12] Dwight_Forester      . Ранг: 3. Заходил: 2017/12/02 12:01:06. Часов: 0 / 1.
023. [1] Vittore_Deltoro       . Ранг: 3. Заходил: 2017/09/12 09:38:34. Часов: 0 / 0.
024. [23] Andres_Clemente      . Ранг: 3. Заходил: 2017/12/01 10:14:32. Часов: 0 / 0.
025. [24] Jimmy_Carter         . Ранг: 3. Заходил: 2017/12/02 12:45:25. Часов: 0 / 0.



5. Форматирование "Классное" (сортировка по дате последнего захода):
001. [15] Oliver_Bryant        . Ранг: 1. Заходил: 2017/12/02 18:42:35. Часов: 0 / 4.
002. [20] Jayden_Williams      . Ранг: 1. Заходил: 2017/12/02 18:27:33. Часов: 1 / 10.
003. [10] Mike_Rein            . Ранг: 7. Заходил: 2017/12/02 18:22:51. Часов: 3 / 41.
004. [0] James_Bond            . Ранг: 9. Заходил: 2017/12/02 18:13:59. Часов: 2 / 288.
005. [18] Biggie_Shakur        . Ранг: 3. Заходил: 2017/12/02 18:10:14. Часов: 0 / 27.
006. [22] Leonardo_Soprano     . Ранг: 4. Заходил: 2017/12/02 18:01:21. Часов: 0 / 15.
007. [3] Francesco_Garsia      . Ранг: 8. Заходил: 2017/12/02 17:53:16. Часов: 5 / 132.
008. [13] Ramzes_Galager       . Ранг: 4. Заходил: 2017/12/02 16:08:36. Часов: 1 / 54.
009. [24] Jimmy_Carter         . Ранг: 3. Заходил: 2017/12/02 12:45:25. Часов: 0 / 0.
010. [7] Quentin_Buratino      . Ранг: 4. Заходил: 2017/12/02 12:43:54. Часов: 0 / 51.
011. [12] Dwight_Forester      . Ранг: 3. Заходил: 2017/12/02 12:01:06. Часов: 0 / 1.
012. [8] Jax_Teller            . Ранг: 3. Заходил: 2017/12/02 09:42:06. Часов: 0 / 36.
013. [14] Morgan_Egorov        . Ранг: 3. Заходил: 2017/12/01 23:23:52. Часов: 0 / 2.
014. [21] Supsqwizzy_Kreslo    . Ранг: 1. Заходил: 2017/12/01 18:10:32. Часов: 0 / 3.
015. [6] Alejandro_Sauce       . Ранг: 4. Заходил: 2017/12/01 18:07:10. Часов: 0 / 44.
016. [16] Rolling_Stoner       . Ранг: 1. Заходил: 2017/12/01 12:41:10. Часов: 0 / 7.
017. [23] Andres_Clemente      . Ранг: 3. Заходил: 2017/12/01 10:14:32. Часов: 0 / 0.
018. [4] Alex_Rein             . Ранг: 6. Заходил: 2017/11/30 22:22:44. Часов: 0 / 129.
019. [19] Benjamin_Fairless    . Ранг: 3. Заходил: 2017/11/30 19:28:27. Часов: 0 / 2.
020. [17] Charles_Mordecai     . Ранг: 3. Заходил: 2017/11/30 17:23:16. Часов: 0 / 12.
021. [5] Chester_Phillips      . Ранг: 5. Заходил: 2017/11/26 16:43:43. Часов: 0 / 83.
022. [11] Igor_Strelkov        . Ранг: 2. Заходил: 2017/11/24 19:15:07. Часов: 0 / 17.
023. [2] Alan_Morgan           . Ранг: 4. Заходил: 2017/11/19 16:41:37. Часов: 0 / 52.
024. [9] Daniel_Defo           . Ранг: 3. Заходил: 2017/11/12 22:12:01. Часов: 0 / 7.
025. [1] Vittore_Deltoro       . Ранг: 3. Заходил: 2017/09/12 09:38:34. Часов: 0 / 0.



6. Форматирование "Классное" (сортировка по рангу, ранг по порядковому номеру):
Ранг: 9
[0] James_Bond            . Ранг: 9. Заходил: 2017/12/02 18:13:59. Часов: 2 / 288.
Ранг: 8
[3] Francesco_Garsia      . Ранг: 8. Заходил: 2017/12/02 17:53:16. Часов: 5 / 132.
Ранг: 7
[10] Mike_Rein            . Ранг: 7. Заходил: 2017/12/02 18:22:51. Часов: 3 / 41.
Ранг: 6
[4] Alex_Rein             . Ранг: 6. Заходил: 2017/11/30 22:22:44. Часов: 0 / 129.
Ранг: 5
[5] Chester_Phillips      . Ранг: 5. Заходил: 2017/11/26 16:43:43. Часов: 0 / 83.
Ранг: 4
[2] Alan_Morgan           . Ранг: 4. Заходил: 2017/11/19 16:41:37. Часов: 0 / 52.
[6] Alejandro_Sauce       . Ранг: 4. Заходил: 2017/12/01 18:07:10. Часов: 0 / 44.
[7] Quentin_Buratino      . Ранг: 4. Заходил: 2017/12/02 12:43:54. Часов: 0 / 51.
[13] Ramzes_Galager       . Ранг: 4. Заходил: 2017/12/02 16:08:36. Часов: 1 / 54.
[22] Leonardo_Soprano     . Ранг: 4. Заходил: 2017/12/02 18:01:21. Часов: 0 / 15.
Ранг: 3
[1] Vittore_Deltoro       . Ранг: 3. Заходил: 2017/09/12 09:38:34. Часов: 0 / 0.
[8] Jax_Teller            . Ранг: 3. Заходил: 2017/12/02 09:42:06. Часов: 0 / 36.
[9] Daniel_Defo           . Ранг: 3. Заходил: 2017/11/12 22:12:01. Часов: 0 / 7.
[12] Dwight_Forester      . Ранг: 3. Заходил: 2017/12/02 12:01:06. Часов: 0 / 1.
[14] Morgan_Egorov        . Ранг: 3. Заходил: 2017/12/01 23:23:52. Часов: 0 / 2.
[17] Charles_Mordecai     . Ранг: 3. Заходил: 2017/11/30 17:23:16. Часов: 0 / 12.
[18] Biggie_Shakur        . Ранг: 3. Заходил: 2017/12/02 18:10:14. Часов: 0 / 27.
[19] Benjamin_Fairless    . Ранг: 3. Заходил: 2017/11/30 19:28:27. Часов: 0 / 2.
[23] Andres_Clemente      . Ранг: 3. Заходил: 2017/12/01 10:14:32. Часов: 0 / 0.
[24] Jimmy_Carter         . Ранг: 3. Заходил: 2017/12/02 12:45:25. Часов: 0 / 0.
Ранг: 2
[11] Igor_Strelkov        . Ранг: 2. Заходил: 2017/11/24 19:15:07. Часов: 0 / 17.
Ранг: 1
[15] Oliver_Bryant        . Ранг: 1. Заходил: 2017/12/02 18:42:35. Часов: 0 / 4.
[16] Rolling_Stoner       . Ранг: 1. Заходил: 2017/12/01 12:41:10. Часов: 0 / 7.
[20] Jayden_Williams      . Ранг: 1. Заходил: 2017/12/02 18:27:33. Часов: 1 / 10.
[21] Supsqwizzy_Kreslo    . Ранг: 1. Заходил: 2017/12/01 18:10:32. Часов: 0 / 3.



7. Форматирование "Классное" (сортировка по рангу, ранг по активности за сутки):
Ранг: 9   
001. [0] James_Bond            . Ранг: 9. Заходил: 2017/12/02 18:13:59. Часов: 2 / 288.
Ранг: 8   
001. [3] Francesco_Garsia      . Ранг: 8. Заходил: 2017/12/02 17:53:16. Часов: 5 / 132.
Ранг: 7   
001. [10] Mike_Rein            . Ранг: 7. Заходил: 2017/12/02 18:22:51. Часов: 3 / 41.
Ранг: 6   
001. [4] Alex_Rein             . Ранг: 6. Заходил: 2017/11/30 22:22:44. Часов: 0 / 129.
Ранг: 5   
001. [5] Chester_Phillips      . Ранг: 5. Заходил: 2017/11/26 16:43:43. Часов: 0 / 83.
Ранг: 4   
001. [13] Ramzes_Galager       . Ранг: 4. Заходил: 2017/12/02 16:08:36. Часов: 1 / 54.
002. [2] Alan_Morgan           . Ранг: 4. Заходил: 2017/11/19 16:41:37. Часов: 0 / 52.
003. [7] Quentin_Buratino      . Ранг: 4. Заходил: 2017/12/02 12:43:54. Часов: 0 / 51.
004. [6] Alejandro_Sauce       . Ранг: 4. Заходил: 2017/12/01 18:07:10. Часов: 0 / 44.
005. [22] Leonardo_Soprano     . Ранг: 4. Заходил: 2017/12/02 18:01:21. Часов: 0 / 15.
Ранг: 3   
001. [1] Vittore_Deltoro       . Ранг: 3. Заходил: 2017/09/12 09:38:34. Часов: 0 / 0.
002. [17] Charles_Mordecai     . Ранг: 3. Заходил: 2017/11/30 17:23:16. Часов: 0 / 12.
003. [18] Biggie_Shakur        . Ранг: 3. Заходил: 2017/12/02 18:10:14. Часов: 0 / 27.
004. [19] Benjamin_Fairless    . Ранг: 3. Заходил: 2017/11/30 19:28:27. Часов: 0 / 2.
005. [23] Andres_Clemente      . Ранг: 3. Заходил: 2017/12/01 10:14:32. Часов: 0 / 0.
006. [14] Morgan_Egorov        . Ранг: 3. Заходил: 2017/12/01 23:23:52. Часов: 0 / 2.
007. [9] Daniel_Defo           . Ранг: 3. Заходил: 2017/11/12 22:12:01. Часов: 0 / 7.
008. [12] Dwight_Forester      . Ранг: 3. Заходил: 2017/12/02 12:01:06. Часов: 0 / 1.
009. [8] Jax_Teller            . Ранг: 3. Заходил: 2017/12/02 09:42:06. Часов: 0 / 36.
010. [24] Jimmy_Carter         . Ранг: 3. Заходил: 2017/12/02 12:45:25. Часов: 0 / 0.
Ранг: 2   
001. [11] Igor_Strelkov        . Ранг: 2. Заходил: 2017/11/24 19:15:07. Часов: 0 / 17.
Ранг: 1   
001. [20] Jayden_Williams      . Ранг: 1. Заходил: 2017/12/02 18:27:33. Часов: 1 / 10.
002. [15] Oliver_Bryant        . Ранг: 1. Заходил: 2017/12/02 18:42:35. Часов: 0 / 4.
003. [16] Rolling_Stoner       . Ранг: 1. Заходил: 2017/12/01 12:41:10. Часов: 0 / 7.
004. [21] Supsqwizzy_Kreslo    . Ранг: 1. Заходил: 2017/12/01 18:10:32. Часов: 0 / 3.



8. Форматирование "Классное" (сортировка по рангу, ранг по активности за неделю):
Ранг: 9
001. [0] James_Bond            . Ранг: 9. Заходил: 2017/12/02 18:13:59. Часов: 2 / 288.
Ранг: 8
001. [3] Francesco_Garsia      . Ранг: 8. Заходил: 2017/12/02 17:53:16. Часов: 5 / 132.
Ранг: 7
001. [10] Mike_Rein            . Ранг: 7. Заходил: 2017/12/02 18:22:51. Часов: 3 / 41.
Ранг: 6
001. [4] Alex_Rein             . Ранг: 6. Заходил: 2017/11/30 22:22:44. Часов: 0 / 129.
Ранг: 5
001. [5] Chester_Phillips      . Ранг: 5. Заходил: 2017/11/26 16:43:43. Часов: 0 / 83.
Ранг: 4
001. [13] Ramzes_Galager       . Ранг: 4. Заходил: 2017/12/02 16:08:36. Часов: 1 / 54.
002. [2] Alan_Morgan           . Ранг: 4. Заходил: 2017/11/19 16:41:37. Часов: 0 / 52.
003. [7] Quentin_Buratino      . Ранг: 4. Заходил: 2017/12/02 12:43:54. Часов: 0 / 51.
004. [6] Alejandro_Sauce       . Ранг: 4. Заходил: 2017/12/01 18:07:10. Часов: 0 / 44.
005. [22] Leonardo_Soprano     . Ранг: 4. Заходил: 2017/12/02 18:01:21. Часов: 0 / 15.
Ранг: 3
001. [8] Jax_Teller            . Ранг: 3. Заходил: 2017/12/02 09:42:06. Часов: 0 / 36.
002. [18] Biggie_Shakur        . Ранг: 3. Заходил: 2017/12/02 18:10:14. Часов: 0 / 27.
003. [17] Charles_Mordecai     . Ранг: 3. Заходил: 2017/11/30 17:23:16. Часов: 0 / 12.
004. [9] Daniel_Defo           . Ранг: 3. Заходил: 2017/11/12 22:12:01. Часов: 0 / 7.
005. [19] Benjamin_Fairless    . Ранг: 3. Заходил: 2017/11/30 19:28:27. Часов: 0 / 2.
006. [14] Morgan_Egorov        . Ранг: 3. Заходил: 2017/12/01 23:23:52. Часов: 0 / 2.
007. [12] Dwight_Forester      . Ранг: 3. Заходил: 2017/12/02 12:01:06. Часов: 0 / 1.
008. [1] Vittore_Deltoro       . Ранг: 3. Заходил: 2017/09/12 09:38:34. Часов: 0 / 0.
009. [23] Andres_Clemente      . Ранг: 3. Заходил: 2017/12/01 10:14:32. Часов: 0 / 0.
010. [24] Jimmy_Carter         . Ранг: 3. Заходил: 2017/12/02 12:45:25. Часов: 0 / 0.
Ранг: 2
001. [11] Igor_Strelkov        . Ранг: 2. Заходил: 2017/11/24 19:15:07. Часов: 0 / 17.
Ранг: 1
001. [20] Jayden_Williams      . Ранг: 1. Заходил: 2017/12/02 18:27:33. Часов: 1 / 10.
002. [16] Rolling_Stoner       . Ранг: 1. Заходил: 2017/12/01 12:41:10. Часов: 0 / 7.
003. [15] Oliver_Bryant        . Ранг: 1. Заходил: 2017/12/02 18:42:35. Часов: 0 / 4.
004. [21] Supsqwizzy_Kreslo    . Ранг: 1. Заходил: 2017/12/01 18:10:32. Часов: 0 / 3.



9. Форматирование "Классное" (сортировка по рангу, ранг по дате последнего захода):
Ранг: 9   
001. [0] James_Bond            . Ранг: 9. Заходил: 2017/12/02 18:13:59. Часов: 2 / 288.
Ранг: 8   
001. [3] Francesco_Garsia      . Ранг: 8. Заходил: 2017/12/02 17:53:16. Часов: 5 / 132.
Ранг: 7   
001. [10] Mike_Rein            . Ранг: 7. Заходил: 2017/12/02 18:22:51. Часов: 3 / 41.
Ранг: 6   
001. [4] Alex_Rein             . Ранг: 6. Заходил: 2017/11/30 22:22:44. Часов: 0 / 129.
Ранг: 5   
001. [5] Chester_Phillips      . Ранг: 5. Заходил: 2017/11/26 16:43:43. Часов: 0 / 83.
Ранг: 4   
001. [22] Leonardo_Soprano     . Ранг: 4. Заходил: 2017/12/02 18:01:21. Часов: 0 / 15.
002. [13] Ramzes_Galager       . Ранг: 4. Заходил: 2017/12/02 16:08:36. Часов: 1 / 54.
003. [7] Quentin_Buratino      . Ранг: 4. Заходил: 2017/12/02 12:43:54. Часов: 0 / 51.
004. [6] Alejandro_Sauce       . Ранг: 4. Заходил: 2017/12/01 18:07:10. Часов: 0 / 44.
005. [2] Alan_Morgan           . Ранг: 4. Заходил: 2017/11/19 16:41:37. Часов: 0 / 52.
Ранг: 3   
001. [18] Biggie_Shakur        . Ранг: 3. Заходил: 2017/12/02 18:10:14. Часов: 0 / 27.
002. [24] Jimmy_Carter         . Ранг: 3. Заходил: 2017/12/02 12:45:25. Часов: 0 / 0.
003. [12] Dwight_Forester      . Ранг: 3. Заходил: 2017/12/02 12:01:06. Часов: 0 / 1.
004. [8] Jax_Teller            . Ранг: 3. Заходил: 2017/12/02 09:42:06. Часов: 0 / 36.
005. [14] Morgan_Egorov        . Ранг: 3. Заходил: 2017/12/01 23:23:52. Часов: 0 / 2.
006. [23] Andres_Clemente      . Ранг: 3. Заходил: 2017/12/01 10:14:32. Часов: 0 / 0.
007. [19] Benjamin_Fairless    . Ранг: 3. Заходил: 2017/11/30 19:28:27. Часов: 0 / 2.
008. [17] Charles_Mordecai     . Ранг: 3. Заходил: 2017/11/30 17:23:16. Часов: 0 / 12.
009. [9] Daniel_Defo           . Ранг: 3. Заходил: 2017/11/12 22:12:01. Часов: 0 / 7.
010. [1] Vittore_Deltoro       . Ранг: 3. Заходил: 2017/09/12 09:38:34. Часов: 0 / 0.
Ранг: 2   
001. [11] Igor_Strelkov        . Ранг: 2. Заходил: 2017/11/24 19:15:07. Часов: 0 / 17.
Ранг: 1   
001. [15] Oliver_Bryant        . Ранг: 1. Заходил: 2017/12/02 18:42:35. Часов: 0 / 4.
002. [20] Jayden_Williams      . Ранг: 1. Заходил: 2017/12/02 18:27:33. Часов: 1 / 10.
003. [21] Supsqwizzy_Kreslo    . Ранг: 1. Заходил: 2017/12/01 18:10:32. Часов: 0 / 3.
004. [16] Rolling_Stoner       . Ранг: 1. Заходил: 2017/12/01 12:41:10. Часов: 0 / 7.
```