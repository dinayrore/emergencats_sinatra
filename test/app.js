var createCats = require('../app')
var chai = require('chai')
var expect = chai.expect

describe('createCats', function () {
  context('when  input is "+ 1 2"', function() {
    it('returns 3', function(){
      // Arrange
      var calculator = new Calculator()
      var expr = '1 + 2'

      // Act
      var result = calculator.calculate(expr)

      // Assert
      expect(result).to.equal(3)
    })
  })
})
