using System;
using System.Collections.Generic;
using System.Text;

namespace Common.Interfaces.Data
{
    public interface ITopic
    {
        int AccountId { get; set; }
        Guid TopicId { get; set; }
        string TopicName { get; set; }
        DateTime DateCreated { get; set; }
        bool IsActive { get; set; }
    }
}
