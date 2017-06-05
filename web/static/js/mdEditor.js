import React from 'react';
import ReactDOM from 'react-dom';

import MarkdownEditor from 'cute-md-editor';

ReactDOM.render(
  <MarkdownEditor
    elementId="post_content"
    elementName="post[content]"
    content={content} />,
  document.getElementById('react-test')
);
