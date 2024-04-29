using System;
using System.Collections.Generic;

namespace JOACOProjectByEmNEm.Models;

public partial class Message
{
    public int MessageId { get; set; }

    public string Id { get; set; } = null!;

    public string Contenu { get; set; } = null!;

    public string Sujet { get; set; } = null!;

    public virtual AspNetUser IdNavigation { get; set; } = null!;
}
