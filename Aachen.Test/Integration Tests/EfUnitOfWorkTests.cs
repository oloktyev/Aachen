using System;
using System.Linq;
using System.Transactions;
using Aachen.Core.EF;
using Aachen.Core.Interfaces;
using Aachen.Core.Model;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace Aachen.Test.IntegrationTests
{
    [TestClass]
    public class JokeServiceTests
    {
        private TransactionScope _transactionScope;
        private IUnitOfWork _uow;

        [TestInitialize]
        public void TestSetUp()
        {
            _transactionScope = new TransactionScope(TransactionScopeOption.RequiresNew, TimeSpan.FromMinutes(1));
            _uow = new EfUnitOfWork();
        }

        [TestCleanup]
        public void TestCleanup()
        {
            Transaction.Current.Rollback();
            _transactionScope.Dispose();
        }

        [TestMethod]
        public void GetAllJokes_Should_Return_Results_With_Resource_And_Type()
        {
            var repository = _uow.Jokes;
            var result = repository.GetAll().ToList();
            Assert.IsTrue(result.Count > 0);
            Assert.IsNotNull(result[0].Resource);
            Assert.IsNotNull(result[0].Resource.Type);
        }

        [TestMethod]
        public void UnitOfWork_Should_Save_Jokes()
        {
            var repository = _uow.Jokes;
            var joke = new Joke
                {
                    CreatedDate = DateTime.Now,
                    Description = "desc",
                    Resource = _uow.Resources.GetAll().First()
                };
            repository.Add(joke);
            _uow.CommitChanges();

            var result = repository.GetAll().ToList();
            
            Assert.IsTrue(result.Count > 1);
            Assert.IsNotNull(result[0].Resource);
            Assert.IsNotNull(result[0].Resource.Type);
        }

        [TestMethod]
        public void GetAllResources_Should_Return_Results_With_Type()
        {
            var repository = _uow.Resources;
            var result = repository.GetAll().ToList();
            Assert.IsTrue(result.Count > 0);
            Assert.IsNotNull(result[0].Type);
        }

        [TestMethod]
        public void GetLatestJokes_Should_Return_Results()
        {
            var repository = _uow.Jokes;
            var result = repository.GetLatestJokes();
            Assert.IsTrue(result.Count > 0);
        }
    }
}
