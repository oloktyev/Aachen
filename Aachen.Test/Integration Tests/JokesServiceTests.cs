using System;
using Aachen.Core.EF;
using Aachen.Core.Interfaces;
using Aachen.Core.Interfaces.Services;
using Aachen.Infrastructure.Services;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace Aachen.Test.Integration_Tests
{
    [TestClass]
    public class JokesServiceTests
    {
        private IJokesService _jokesService;
        private IUnitOfWork _uow;

        [TestInitialize]
        public void TestSetUp()
        {
            _uow = new EfUnitOfWork();
            _jokesService = new JokesService(_uow);
        }

        [TestCleanup]
        public void TestCleanup()
        {
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
    }
}
