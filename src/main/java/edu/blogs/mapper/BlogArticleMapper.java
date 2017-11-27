package edu.blogs.mapper;

import edu.blogs.pojo.BlogArticle;
import edu.blogs.pojo.BlogArticleExample;
import edu.blogs.pojo.BlogArticleWithBLOBs;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface BlogArticleMapper {
    int countByExample(BlogArticleExample example);

    int deleteByExample(BlogArticleExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(BlogArticleWithBLOBs record);

    int insertSelective(BlogArticleWithBLOBs record);

    List<BlogArticleWithBLOBs> selectByExampleWithBLOBs(BlogArticleExample example);

    List<BlogArticle> selectByExample(BlogArticleExample example);

    BlogArticleWithBLOBs selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") BlogArticleWithBLOBs record, @Param("example") BlogArticleExample example);

    int updateByExampleWithBLOBs(@Param("record") BlogArticleWithBLOBs record, @Param("example") BlogArticleExample example);

    int updateByExample(@Param("record") BlogArticle record, @Param("example") BlogArticleExample example);

    int updateByPrimaryKeySelective(BlogArticleWithBLOBs record);

    int updateByPrimaryKeyWithBLOBs(BlogArticleWithBLOBs record);

    int updateByPrimaryKey(BlogArticle record);
}