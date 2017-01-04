using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ThanhTuanShop.Data.Infrastructure
{
    public class DbFactory : Disposable, IDbFactory
    {
        ThanhTuanDbContext dbContext;
        public ThanhTuanDbContext Init()
        {
            return dbContext ?? (dbContext = new ThanhTuanDbContext());
        }
        protected override void DisposeCore()
        {
            if (dbContext != null)
                dbContext.Dispose();
        }
    }
}
