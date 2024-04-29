using System;
using System.Collections.Generic;

namespace JOACOProjectByEmNEm.Models;

public partial class Blog
{
    public int ArticleId { get; set; }

    public string? Id { get; set; }

    public string ArticleTitre { get; set; } = null!;

    public string? ArticleContenu { get; set; }

    public DateTime DatePublication { get; set; }

    public string Auteur { get; set; } = null!;

    public virtual AspNetUser? IdNavigation { get; set; }
}
