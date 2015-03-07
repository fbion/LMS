using System;
using System.Data;
using System.IO;
using System.ServiceModel;
using com.hooyes.lms.Svc.Model;

namespace com.hooyes.lms.Svc
{
    [ServiceContract]
    public interface IService1
    {
        [OperationContract]
        R I(M1 mc,string k);

        [OperationContract]
        R V(string k);

        [OperationContract]
        DataSet Summary(string k);
    }
}
