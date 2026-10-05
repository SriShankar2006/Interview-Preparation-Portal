<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="/">
    <html>
      <head><title>Feedback Summary</title></head>
      <body>
        <h2>User Feedbacks </h2>
        <table border="1" cellpadding="5" style="border-collapse:collapse; width:100%">
          <tr bgcolor="lightblue"><th>User</th><th>Topic</th><th>Comment</th></tr>
          <xsl:for-each select="feedbacks/interview_feedbacks/feedback">
            <tr>
              <td><xsl:value-of select="username"/></td>
              <td><xsl:value-of select="topic"/></td>
              <td><xsl:value-of select="comment"/></td>
            </tr>
          </xsl:for-each>
        </table>

        <h2>Interview Feedbacks</h2>
        <table border="1" cellpadding="5" style="border-collapse:collapse; width:100%">
          <tr bgcolor="lightgreen"><th>Candidate</th><th>Company</th><th>Role</th><th>Difficulty</th><th>Rating</th></tr>
          <xsl:for-each select="feedbacks/portal_feedbacks/interview">
            <tr>
              <td><xsl:value-of select="candidate"/></td>
              <td><xsl:value-of select="company"/></td>
              <td><xsl:value-of select="role"/></td>
              <td><xsl:value-of select="difficulty"/></td>
              <td><xsl:value-of select="rating"/></td>
            </tr>
          </xsl:for-each>
        </table>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
