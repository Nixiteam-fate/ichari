﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Mvc;

using Ichari.Uow;
using Ichari.Model.Admin;
using Ichari.Common;
using Ichari.Common.Extensions;

namespace Ichari.Admin
{
    public class HomeController : BaseController
    {
        private IChariUow _uow;

        public HomeController() { }

        public HomeController(IChariUow uow)
        {
            _uow = uow;
        }

        public ActionResult Index()
        {
            var vm = new ViewModel.IndexViewModel();

            var ls = _uow.LoveChangeService.GetQueryList();
            var lsCount = ls.Count();
            var c = lsCount > 0 ? ls.Sum(t => t.Amount) : 0;

            var orderList = _uow.OrderService.GetQueryList(t => t.OrderType == (int)Ichari.Model.Enum.OrderType.Donation
                                    && t.Status >= (int)Ichari.Model.Enum.OrderState.Paid);
            var d = 0M;                        
            if(orderList.Count()>0)
                d = orderList.Sum(t => t.Total);
            vm.AllDonationAmount = c + d;

            vm.ChangeOfCareCount = lsCount;
            vm.ChangeOfCareAmt = c;
            vm.DonationCount = _uow.OrderService.GetQueryList(t => t.OrderType == (int)Ichari.Model.Enum.OrderType.Donation
                                    && t.Status >= (int)Ichari.Model.Enum.OrderState.Paid).Count();
            vm.DonationAmt = d;
            return View(vm);
        }
    }
}
