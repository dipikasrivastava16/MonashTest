# MonashTest
Use following method to change number of rows.
Due to mock data there is a limitation of the max number of row to 5 for Shuttle bus and Lectures
func getNextlectures(number: Int, onDate: Date = Date()) -> [Lecture]
func getNextShuttleBuses(number: Int, onDate: Date = Date()) -> [ShuttleBus]

For Live Feed/Available Car Park, max is 3
func getNextLiveFeed(number: Int) -> [CarPark]
