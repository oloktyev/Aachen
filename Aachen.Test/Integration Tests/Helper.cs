using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using Aachen.Core.EF;
using Aachen.Core.Interfaces;
using Aachen.Core.Interfaces.Services;
using Aachen.Infrastructure.Services;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace Aachen.Test.Integration_Tests
{
    [TestClass]
    public class Helper
    {

        private IJokesService _jokesService;
        private IUnitOfWork _uow;

        [TestInitialize]
        public void TestSetUp()
        {
            _uow = new EfUnitOfWork();
            _jokesService = new JokesService(_uow);
        }

        [TestMethod]
        public void AddNewJokes()
        {
            var result = _jokesService.AddNewJokes();
            Assert.IsTrue(result.Count > 0);
        }

        [TestMethod]
        public void FixExistingJokes()
        {
            var result = _jokesService.FixExistingJokes();
            Assert.IsTrue(result.Count > 0);
        }

        [TestMethod]
        public void RecalculateCategories()
        {
            var result = _jokesService.RecalculateCategories();
            Assert.IsTrue(result.Count > 0);
        }

        [TestMethod]
        public void RecalculateHash()
        {
            var result = _uow.Jokes.GetAll().ToList();
            
            foreach (var joke in result)
                joke.Hash = joke.GetHashCode();
            
           _uow.CommitChanges();
            Assert.IsTrue(result.Count > 0);
        }
    }
}
