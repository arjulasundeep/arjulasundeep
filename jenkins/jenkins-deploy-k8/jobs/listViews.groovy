listView("seed") {
	jobs {
 	  name('Job_DSL_Seed')
	}
	columns {
		status()
		weather()
		name()
		lastSuccess()
		lastFailure()
		lastDuration()
		buildButton()
	}
}
