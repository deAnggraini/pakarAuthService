package id.co.bca.pakar.be.doc.service;

import id.co.bca.pakar.be.doc.dto.*;
import org.springframework.data.domain.Page;

import java.util.List;

public interface ArticleService {
    Boolean existArticle(String title);

    ArticleDto generateArticle(GenerateArticleDto articleDto) throws Exception;

    ArticleDto getArticleById(Long id) throws Exception;

    MultipartArticleDto saveArticle(MultipartArticleDto articleDto) throws Exception;

    Long getContentId(BaseDto baseDto) throws Exception;

    ArticleContentDto saveContent(ArticleContentDto articleContentDto) throws Exception;

    List<ArticleContentDto> saveBatchContents(List<ArticleContentDto> articleContentDtos, String username, String token) throws Exception;

    Boolean deleteContent(DeleteContentDto deleteContentDto) throws Exception;

    Page<RelatedArticleDto> search(SearchDto searchDto) throws Exception;
}