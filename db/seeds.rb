facts = [
  %(Test fact #1.),
  %(Test Fact #2.),
  %(Test Fact #3.)
]
facts.map!{|f| { body: f } }
Fact.create(facts)
