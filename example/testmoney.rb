require 'samin'
#!/usr/bin/env ruby
# encoding: utf-8

include Samin

Money.conversion_rates('EUR', {
  'USD'     => 1.11,
  'Bitcoin' => 0.0047
})

fifty_eur = Money.new(50, 'EUR')

puts "fifty_eur.amount => #{fifty_eur.amount}"
puts "fifty_eur.currency =>#{fifty_eur.currency}"
puts "fifty_eur.inspect =>#{fifty_eur.inspect}"

puts "fifty_eur.convert_to('USD') => #{(fifty_eur.convert_to('USD')).inspect}"

## Arithmetics:
twenty_dollars = Money.new(20, 'USD')
puts "fifty_eur + twenty_dollars => #{(fifty_eur + twenty_dollars).inspect} "
puts "fifty_eur - twenty_dollars =>  #{(fifty_eur - twenty_dollars).inspect} "
puts "fifty_eur / 2 =>  #{(fifty_eur / 2).inspect} "
puts "twenty_dollars * 3 =>  #{(twenty_dollars * 3).inspect} "

## Comparisons (also in different currencies):
puts "twenty_dollars == Money.new(20, 'USD')  => #{twenty_dollars == Money.new(20, 'USD')}"
puts "twenty_dollars == Money.new(30, 'USD')  => #{twenty_dollars == Money.new(30, 'USD')}"

puts "fifty_eur_in_usd = fifty_eur.convert_to('USD') => #{(fifty_eur_in_usd = fifty_eur.convert_to('USD')).inspect}"
puts "fifty_eur_in_usd == fifty_eur           => #{fifty_eur_in_usd == fifty_eur}"

puts "twenty_dollars > Money.new(5, 'USD')    => #{twenty_dollars > Money.new(5, 'USD')}"
puts "twenty_dollars < fifty_eur              => #{twenty_dollars < fifty_eur}"
