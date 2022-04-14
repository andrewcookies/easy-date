# ACEasyDate
Library for date handling in Swift.

Beta Version 0.1.0

This library offers some methods to move out from your code all the calculation and code managing regarding date, using ACEasyDate() object.

## ACEasyDate Funcionalities
### Comparison

Comparing ACEasyDate in a direct and easy way.

```
let date = ACEasyDate() //current date
let later = ACEasyDate(epoch: date.epoch + 3600) //create ACEasyDate() an hour later

date.isAfter(later) // false
date.isBefore(later) // true
date.isSameDay(later) // depending when date has been initialized

```
### String handing

One of the most waste of time in date managing is print date. ACEasyDate() offers some shortcut.

```
let date = ACEasyDate(epoch: YOUR_EPOCH_TIME ) 
date.acEasyDateFormat = "yyyy/MM/dd HH:ss"
date.dateString //print you date

//..and following your device settings...

date.dayOfWeekLong // ("Sunday","Monday"...)
date.dayOfWeekShort // ("Sun","Mon"...)
date.dayOfWeekInit //  ("S","M"...)


```

### Timezone

API calls which manage time event return in addition to the date timestamp also the referring timezione (by int, string, abbreviation..)
ACEasyDate() try to move out timezone logic from developer, reducing the impact on the base code.

```
 let sdAPI = ACEasyDate(epoch: EPOCH_FROM_APOI_CALL)
 let sdTimezone = sdAPI.convertToCurrentTimeZone(to: TimeZone(secondsFromGMT: 21600) ?? TimeZone.current)
 let sdTimezne.dateString //print the date from API in current timezone
 
 let currentSDate = ACEasyDate()
 let dateForApi = currentSDate.convertFromCurrentTimeZone(to: TimeZone(secondsFromGMT: 21600) ?? TimeZone.current)
 let dateForApi.dateString // print current date in the given timezone

```
