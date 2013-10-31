using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Aachen.Core.Model;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace Aachen.Test.Unit_tests.Model
{
    [TestClass]
    public class JokeTests
    {
        [TestMethod]
        [TestCategory("Model")]
        public void Hash_ShouldReturnFalseForDifferentStrings()
        {
            var joke = new Joke
            {
                Description = @"Вовочка входит в класс с опозданием в 5 минут. Учительница: 
                                 -Вова, ты где был? 
                                 -Картошку жарил, Марья Ивановна. 
                                 -?! садись... 
                                Еще через 10 мин. В класс заходит Катя. Учительница: 
                                 - Картошкина, а ты где была?"
            };
            
            var otherJoke = new Joke
            {
                Description = "a,,a"
            };

            Assert.AreNotEqual(joke.Hash, otherJoke.Hash);
        }

        [TestMethod]
        [TestCategory("Model")]
        public void Hash_ShouldReturnTrueForSimilarStrings()
        {
            var joke = new Joke
            {
                Description = @"Вовочка входит в класс с опозданием в 5 минут. Учительница: 
                                 -Вова, ты где был? 
                                 -Картошку жарил, Марья Ивановна. 
                                 -?! садись... 
                                Еще через 10 мин. В класс заходит Катя. Учительница: 
                                 - Картошкина, а ты где была?"
            };

            var otherJoke = new Joke
            {
                Description = @"Вовочка входит в класс с опозданием в 5 минут. Учительница: -Вова, ты где был? -Картошку жарил, Марья Ивановна. -?! садись&#8230; Еще через 10 мин. В класс заходит Катя. Учительница: - Картошкина, а ты где была?"
            };

            Assert.AreEqual(joke.Hash, otherJoke.Hash);
        }
    }
}
