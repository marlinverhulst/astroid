class_name Subject

var _observers = {}
# takes in an Callable(self, "my_callback"):   
func subscribe(callBack: Callable) -> int:
	var randomGenerator = RandomNumberGenerator.new()
	var id = randomGenerator.randi()
	_observers[id] = callBack
	return id

func unsubscribe(subscriberId: int):
	_observers.erase(subscriberId)
	
func emit(args):
	for key in _observers:
		var functionRef = _observers[key]
		functionRef.call(args)	
