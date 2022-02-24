listView("seed") {
    jobs {
	regex('Job_DSL.+')
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
